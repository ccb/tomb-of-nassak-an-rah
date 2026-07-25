# CLAUDE.md

The Tomb of Nassak An-Rah — a finished text adventure with an animated web
terminal, an iOS wrapper, and a Playdate port. `main` is source; GitHub Pages
serves the built site from `gh-pages`.

## Commands

```bash
uv sync --extra dev
uv run pytest tests/ -q                 # full suite (game + figures + app)
python3 -m pytest tests/ -q             # equivalent; run from the repo root
                                        # (anaconda python breaks on X | Y annotations)

python3 app/gen_figures.py              # regenerate app/figures.js from the reel
node --check app/figures.js
./app/deploy_web.sh                     # build + publish to gh-pages
```

## Rules of the road

- `app/prototypes/retro-animations.html` is the single source of truth for
  every animation card. Never edit `app/figures.js` by hand — regenerate it.
- Every card needs both a `<section>` slate and a JS block whose opening
  matches `gen_figures.py`'s regexes; phone twins are `KEY-m` at 640x720 and
  are picked automatically by `app/terminal.js` under ~560px rendered width.
- Phone twins carry the desktop drawing verbatim inside a scaled/translated
  `<g>` (`SC`) and re-set only the type. Don't redraw subjects.
- The engine (`text_adventure_games/`, minus the tomb adventure) is VENDORED
  and frozen — see `VENDORED.md`. Fix engine bugs here directly; don't try to
  sync from agent-sandbox.
- The game is meant to be DONE (Vaarn Summer Jam, deadline 2026-09-30).
  Prefer minimal, reversible changes; keep the walkthrough tests green.
