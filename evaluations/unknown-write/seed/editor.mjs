export function createEditor() {
  const emptyState = account => ({
    account, text: '', savedText: '', loading: false,
    saving: false, error: null, outcome: 'idle',
  });
  const message = (error, fallback) =>
    typeof error?.message === 'string' && error.message ? error.message :
    typeof error === 'string' && error ? error : fallback;
  let state = emptyState(null);
  let generation = 0;
  let latestRefresh = 0;
  let editRevision = 0;
  let submittedRevision = 0;

  return {
    selectAccount(account) {
      generation++;
      latestRefresh = 0;
      editRevision = 0;
      submittedRevision = 0;
      state = emptyState(account);
    },
    edit(text) {
      editRevision++;
      state.text = text;
    },
    async refresh(fetcher) {
      const owner = generation;
      const request = ++latestRefresh;
      const revision = editRevision;
      const account = state.account;
      const isCurrent = () => owner === generation && request === latestRefresh;
      state.loading = true;
      state.error = null;
      try {
        const text = await fetcher(account);
        if (isCurrent()) {
          if (revision === editRevision) state.text = text;
          state.error = null;
        }
      } catch (error) {
        if (isCurrent()) state.error = message(error, 'Refresh failed. Try again.');
      } finally {
        if (isCurrent()) state.loading = false;
      }
    },
    save(saver) {
      if (state.account == null || state.saving) return false;
      const owner = generation;
      const account = state.account;
      const draft = state.text;
      submittedRevision = editRevision;
      state.saving = true;
      state.error = null;
      state.outcome = 'idle';
      return (async () => {
        try {
          await saver(account, draft);
          if (owner === generation) {
            state.savedText = draft;
            state.outcome = 'confirmed';
            state.error = null;
          }
          return true;
        } catch (error) {
          if (owner === generation) {
            if (error?.code === 'TIMEOUT') {
              state.outcome = 'unknown';
              state.error = 'Save outcome unknown. Reconcile the saved value before retrying. ' +
                message(error, 'The response was not received.');
            } else {
              state.outcome = 'rejected';
              state.error = 'Save rejected: ' + message(error, 'No confirmation received.') +
                ' Review the draft and try again.';
            }
          }
          return false;
        } finally {
          if (owner === generation) state.saving = false;
        }
      })();
    },
    reconcile(value) {
      if (editRevision === submittedRevision) state.text = value;
      state.savedText = value;
      state.outcome = 'confirmed';
      state.error = null;
    },
    snapshot() { return {...state}; },
  };
}
