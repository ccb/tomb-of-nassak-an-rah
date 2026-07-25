#!/usr/bin/env bash
# Deploy the web build to https://ccb.github.io/tomb-of-nassak-an-rah/
#
# This repo's gh-pages branch holds only built artifacts; this script
# rebuilds dist/ (CDN runtime -- ~1 MB) and force-refreshes that branch.
# NOTE: the wheel ships the Python source, walkthroughs included -- the
# deploy publishes the game's solutions to anyone who unzips it.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
REPO_URL="https://github.com/ccb/tomb-of-nassak-an-rah.git"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

cd "$HERE/.."
rm -rf app/dist
uv run python app/build_dist.py   # CDN runtime: no --with-pyodide for web
uv run python app/build_iphone_reel.py   # keep /animations-iphone/ alive on deploy

git clone -q --depth 1 --branch gh-pages "$REPO_URL" "$WORK"
find "$WORK" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
cp -r app/dist/* "$WORK/"
touch "$WORK/.nojekyll"

cd "$WORK"
git add -A
if git diff --cached --quiet; then
    echo "nothing changed; site already current"
    exit 0
fi
git commit -q -m "deploy: $(git -C "$HERE/.." rev-parse --short HEAD)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
git push -q origin gh-pages
echo "deployed -> https://ccb.github.io/tomb-of-nassak-an-rah/ (live in ~1 min)"
