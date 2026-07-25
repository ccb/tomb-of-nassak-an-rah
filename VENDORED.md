# Vendored code

## `text_adventure_games/` — the interactive-fiction engine

Vendored from the private `ccb/agent-sandbox` repository at commit
`099eb0a8a39ff9e8b2037635000a2e8c51a494cb` (branch `iphone-animations`,
2026-07-25). The engine continues to evolve there for other projects; this
copy is **frozen deliberately** so the Tomb of Nassak An-Rah stays a finished,
self-contained game.

- The game's own adventure module,
  `text_adventure_games/adventures/tomb_of_nassak_an_rah.py`, is NOT vendored
  code — it is this repository's primary source, with its full history.
- Bug fixes that affect the tomb should be made directly to the vendored copy
  here, like any other game code.
- If a specific upstream engine improvement is ever wanted, cherry-pick it
  from agent-sandbox and note the source commit here.
