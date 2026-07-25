# The Tomb of Nassak An-Rah

A text adventure set in the Vaarn of Ultraviolet Grasslands lineage: a
scavenger, a blue stone tomb, a fungal tenant with four thousand years of
patience. Play it in a browser — with a full deck of animated retro "litho
cards" that illustrate what the parser describes — or on iOS, or on a Playdate.

**Play it now:** https://ccb.github.io/tomb-of-nassak-an-rah/

## Repository layout

| Path | What it is |
| --- | --- |
| `text_adventure_games/adventures/tomb_of_nassak_an_rah.py` | The game itself — rooms, items, characters, triggers. |
| `text_adventure_games/` (everything else) | The interactive-fiction engine, vendored and frozen — see `VENDORED.md`. |
| `app/` | The web build: terminal UI, the animated figure pipeline, deploy scripts. |
| `app/prototypes/retro-animations.html` | **Single source of truth** for every animation card (desktop + phone twins). `app/figures.js` is generated from it. |
| `ios/` | The iOS wrapper app (WKWebView over the web build). |
| `playdate/` | The Playdate port. |
| `tests/` | Game, figure, and app tests. |
| `docs/design/` | Design notes for the game, the card system, and the ports. |

## Development

```bash
uv sync --extra dev
uv run pytest tests/ -q                    # game + figure + app tests

# after editing app/prototypes/retro-animations.html:
python3 app/gen_figures.py                 # regenerate app/figures.js
node --check app/figures.js

./app/deploy_web.sh                        # build dist/ and publish to gh-pages
```

The published site (game plus the animation reels at `/animations/` and
`/animations-iphone/`) is served by GitHub Pages from the `gh-pages` branch;
`main` is source only. Animation cards under ~560px rendered width
automatically swap to their `KEY-m` phone twins (see `app/terminal.js`).

## Provenance

Developed in `ccb/agent-sandbox` through summer 2026 and extracted here with
its history. The engine is shared with other projects and is vendored at a
pinned commit (`VENDORED.md`); the game is intentionally self-contained.
