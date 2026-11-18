---
name: verify-ui
description: 'Browser verification of a UI change with evidence. Use when the user says "check it in the browser", "make sure it looks right", "does it work end to end", or after you edit components, pages, styles or templates, even when the change looks trivially correct or a dev server is already running. For a UI error or blank page use debug.'
metadata:
  type: technique
---

**Verifying UI** means seeing this exact change work in a running build and showing the evidence: the URL, the steps, and what the screen, console and network showed.

## Process

1. **Find the page.** From the router, the dev-server config and the package scripts, work out the exact URL where the change renders (port and route) and the steps to reach the changed state. Done when you can name the URL and each action.
2. **Exercise the flow** with the browser tool this session has: load the URL, perform the user's action, and capture the changed state (text, disabled state, layout). Done when you have a screenshot or DOM snapshot of it.
3. **Check console and network** during the flow: errors and warnings, and each request the flow fires with its status. Done when each is clean or explained.
4. **Report** with the template. Each line holds evidence or says "not checked", why, and the exact steps for the user.

<ui-evidence>
**URL:** http://localhost:<port>/<route>
**Flow:** <actions performed>
**Screen:** <what the screenshot shows> | not checked: <why>
**Console:** clean | <errors> | not checked: <why>
**Network:** <METHOD /path → status> | not checked: <why>
**For you to check:** <URL, actions and what to look for, for every line not checked>
</ui-evidence>
