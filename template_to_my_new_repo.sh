#!/bin/zsh
# template_to_my_new_repo.sh
# Usage: ./template_to_my_new_repo.sh <new_project_name> [<remote_repo_url>]
#
# This script clones the current template repo to a new directory, removes git history,
# initializes a new git repo, and optionally sets a new remote.

set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 <new_project_name> [<remote_repo_url>]"
    echo "📦 Usage: $0 <new_project_name> [<remote_repo_url>]"
  exit 1
fi

NEW_NAME="$1"
REMOTE_URL="$2"
TEMPLATE_DIR=$(pwd)

# Create the new project directory one level up from the template
PARENT_DIR=$(dirname "$TEMPLATE_DIR")
NEW_PATH="$PARENT_DIR/$NEW_NAME"
mkdir "$NEW_PATH"
rsync -av --progress "$TEMPLATE_DIR/" "$NEW_PATH/" --exclude .git
cd "$NEW_PATH"

# Copy .env.example to .env if it exists
if [[ -f .env.example ]]; then
  cp .env.example .env
  echo ".env.example copied to .env. Please update values as needed."
    echo "📝 .env.example copied to .env. Please update values as needed."
fi

# Remove existing git history
rm -rf .git

git init
echo "Initialized new git repository in $NEW_NAME."
 echo "✅ Initialized new git repository in $NEW_NAME."

if [[ -n "$REMOTE_URL" ]]; then
  git remote add origin "$REMOTE_URL"
  echo "🔗 Added remote: $REMOTE_URL"
fi

git add .
git commit -m "feat: initial commit from template"

echo "Project $NEW_NAME is ready."
 echo "🎉 Project $NEW_NAME is ready!"

echo "\nNext steps:"
echo "- Update project details in pyproject.toml, README.md, etc."
echo "- Replace placeholder values in .env and other config files."
echo "- (Optional) Push to remote: git push -u origin main"
