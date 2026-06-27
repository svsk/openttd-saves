#!/usr/bin/env bash
set -euo pipefail

# Usage: ./sync.sh [commit message]
# Default commit message is "Sync".
commit_message="${1:-Sync}"

# Always run from the script's directory so git commands target this repo.
cd "$(dirname "$0")"

# Stage everything (equivalent to: git add .)
git add .

# Only commit if there is something staged.
if ! git diff --cached --quiet; then
  git commit -m "$commit_message"
else
  echo "No staged changes to commit."
fi

# Push local commits and then pull remote updates (mirrors your original flow).
git push
git pull

echo "Sync complete."
