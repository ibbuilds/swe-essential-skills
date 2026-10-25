import assert from 'node:assert/strict';
import {resolve} from 'node:path';
import {pathToFileURL} from 'node:url';
if (process.argv.length !== 3) throw new Error('Provide one submitted client module path');
const target = resolve(process.argv[2]);
const {send} = await import(pathToFileURL(target).href);
let effects=0, lostResponse=false;
const recorded=new Map();
async function service(id,payload) {
  if(recorded.has(id)) {
    const previous=recorded.get(id);
    if(previous.payload!==payload) throw Object.assign(new Error('changed intent'),{code:'INTENT_MISMATCH'});
    return previous.result;
  }
  effects++;
  const result={reservationId:'synthetic-'+effects};
  recorded.set(id,{payload,result});
  if(!lostResponse) { lostResponse=true;throw Object.assign(new Error('response lost'),{code:'TIMEOUT'}); }
  return result;
}
await assert.rejects(()=>send(service,'operation-1','original'),{code:'TIMEOUT'});
const result=await send(service,'operation-1','original');
assert.equal(effects,1,'A supported retry must not become a new operation');
assert.equal(result.reservationId,'synthetic-1');
await assert.rejects(()=>send(service,'operation-1','changed'),{code:'INTENT_MISMATCH'});
assert.equal(effects,1);
assert.equal((await send(service,'operation-2','changed')).reservationId,'synthetic-2');
assert.equal(effects,2,'New intent remains available');
console.log(JSON.stringify({target,passed:true,checks:'same-operation retry, changed-intent denial, valid new operation'}));
