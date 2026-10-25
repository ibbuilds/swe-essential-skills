import assert from 'node:assert/strict';
import {resolve} from 'node:path';
import {pathToFileURL} from 'node:url';

if (process.argv.length !== 3) throw new Error('Provide exactly one submitted editor module path');
const target = resolve(process.argv[2]);
const {createEditor} = await import(pathToFileURL(target).href);
const editor = createEditor();
editor.selectAccount('synthetic-A');
editor.edit('one intended reservation');
let effects = 0;
const timeoutAfterCommit = () => {
  effects++;
  return Promise.reject(Object.assign(new Error('response lost after commit'), {code:'TIMEOUT'}));
};
assert.equal(await editor.save(timeoutAfterCommit), false);
assert.equal(editor.snapshot().outcome, 'unknown');
assert.equal(await editor.save(() => { effects++; return Promise.resolve(); }), false,
  'A new non-idempotent dispatch must wait for reconciliation');
assert.equal(effects, 1, 'The unknown operation must not produce a second effect');
assert.equal(editor.snapshot().outcome, 'unknown');
editor.edit('later draft');
editor.reconcile('one intended reservation');
assert.equal(editor.snapshot().text, 'later draft');
assert.equal(await editor.save(() => { effects++; return Promise.resolve(); }), true);
assert.equal(effects, 2, 'A legitimate new operation after reconciliation must remain available');
assert.equal(editor.snapshot().savedText, 'later draft');
assert.equal(editor.snapshot().outcome, 'confirmed');
console.log(JSON.stringify({target, passed:true, checks:'unknown retry admission, effect count, preserved draft, valid post-reconciliation save'}));
