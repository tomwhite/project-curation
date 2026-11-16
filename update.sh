#!/usr/bin/env bash
# Regenerate all derived data files used by the web pages.
# Assumes data/projects-db.csv has already been downloaded (see README).
set -euo pipefail
cd "$(dirname "$0")"

echo "Updating work repos..."
for repo in bio2zarr cubed sgkit vczstore vcztools; do
  (cd "repos/$repo" && git pull -q origin main)
done

echo "Generating commit counts..."
./git-commits-all.sh > data/git-commits.csv
./git-commits-work.sh > data/git-commits-work.csv

echo "Generating git status..."
./git-status.sh > data/git-status.csv

echo "Generating projects DB with git status..."
./post-process-db.py

echo "Generating legacy projects.json..."
./generate-legacy-project-json.py

echo "Done. Changed data files:"
git status --short data
