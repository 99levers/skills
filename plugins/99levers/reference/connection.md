# Connect to 99Levers

Run this check before a review, build or comparison, and when the user invokes
the login skill. Setup may update the host's MCP configuration; it does not
change the user's app code. Preserve the original task and resume it after setup.

## Check the current session first

Discover the session's available 99Levers MCP tools, including deferred tools.
Tool prefixes vary by host: look for 99Levers tools such as `get_app`,
`get_flow`, `search_flows` and `get_monetization_playbook`.
Use the first read-only tool call needed by the original task to verify access.
For login alone, call `get_monetization_playbook` without app code or user data.
If it succeeds, continue without registering or logging in again.

Missing tools or an authentication error trigger the host-specific setup below.
A timeout, server error, missing app or empty search result is not proof that
login is needed. Report that error without repeatedly registering or logging in.
Do not search a public plugin directory to repair this installed GitHub plugin.

## Codex

The plugin includes its MCP endpoint, but some Codex sessions load the skills
without exposing the bundled tools. Register a direct connection when needed.
Use the terminal to perform setup, rather than merely giving the user commands.
Honor host permissions and explicit user restrictions.

1. Inspect `codex mcp get 99levers --json` and, if needed, `codex mcp list`.
   A missing entry is expected on a fresh install. Do not print credentials or
   read token stores. Inspect only the server name, URL and enabled/auth state.
2. If there is no direct entry, run:

   ```bash
   codex mcp add 99levers --url https://api.99levers.com/mcp
   ```

   Use the same command to replace the known legacy endpoint
   `https://leverz-backend.fly.dev/mcp`. If the existing entry points elsewhere
   or is explicitly disabled, ask before changing that intentional setup.
   Keep unrelated MCP servers and plugin settings intact.
3. `mcp add` can start OAuth itself. If it does, let that login finish instead
   of launching a second login. Otherwise, when authentication is missing or
   rejected, or the user explicitly requested login, run:

   ```bash
   codex mcp login 99levers
   ```

   If authentication state is unknown and tools remain unavailable, attempt
   login once. Tell the user to complete the browser sign-in. Wait for the
   command's result; do not treat an opened browser as a successful connection.
   Leave credential entry and consent to the user. Never ask for passwords,
   tokens or callback URLs in chat. If login is cancelled or fails, report it
   and stop setup without retrying in a loop.
4. Rediscover the session's tools and retry the original read-only call once.
   A successful login does not guarantee a running session has reloaded its
   tools. If tools are still absent, say that setup is saved but this session
   needs restarting. Ask the user to restart Codex and repeat the original
   request; in the CLI, `/mcp` shows loaded servers and tools. Do not claim the
   review or comparison succeeded without library access.

If the Codex CLI is unavailable, provide the two commands above for a local
terminal and explain that setup could not be performed in this environment.
Do not modify global configuration files by hand as a fallback.

## Claude Code

Keep using the plugin's bundled `.mcp.json` connection. Do not run Codex
commands or add a duplicate direct server. If authentication is required,
direct the user to `/mcp`, select the 99Levers server and authenticate.
After connection, retry the original read-only call and continue the task.
If the bundled server is absent, report that the plugin needs reloading in
Claude Code rather than claiming authentication will install it.

## Other hosts

Use the host's MCP connection flow for `https://api.99levers.com/mcp` and OAuth.
Do not assume terminal commands from another host work. Clearly distinguish
registration, completed authentication and verified tool access.

## Command names in replies

Use `$login`, `$review`, `$build` and `$compare` in Codex (select the 99Levers
skill if names collide). Use `/99levers:login`, `/99levers:review`,
`/99levers:build` and `/99levers:compare` in Claude Code. Adapt the command
examples in the other skill files to the current host.
