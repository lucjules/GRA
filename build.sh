#!/usr/bin/env bash
# Construit index.html (document complet) à partir de src/game.html
set -e
cd "$(dirname "$0")"
{
  echo '<!doctype html>'
  echo '<html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  sed -n '1,/^<\/style>/p' src/game.html
  echo '</head><body>'
  sed -n '/^<\/style>/,$p' src/game.html | tail -n +2
  echo '</body></html>'
} > index.html
echo "index.html construit"
