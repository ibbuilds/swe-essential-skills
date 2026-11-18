# Verifying a UI change

1. **Find the page.** From the router, the dev-server config and the package scripts, work out the exact URL (port and route) and the actions that reach the changed state. Done when you can name the URL and each action.
2. **Run it.** If the session has the `run` skill, call the Skill tool with `run` to launch the app. Otherwise start the dev server in the background and use whichever browser tool the session has: the built-in browser, chrome-devtools, Claude in Chrome, or Playwright. Done when the page loads from the current code, not a stale build or an old server.
3. **Exercise the change.** Perform the user's action and capture the changed state: the text, the disabled state, the layout. Take a screenshot or DOM snapshot. Check the states around it as well: loading, error, empty, and a narrow viewport when layout changed.
4. **Read console and network** during the flow. Done when each error is fixed or explained, and each request the flow fires has its method, path and status.

<ui-evidence>
**URL:** http://localhost:<port>/<route>
**Flow:** <actions performed>
**Screen:** <what the screenshot shows> | not verified: <why>
**Console:** clean | <errors> | not verified: <why>
**Network:** <METHOD /path → status> | not verified: <why>
</ui-evidence>
