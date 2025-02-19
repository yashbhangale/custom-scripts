#!/bin/bash

# Change directory to your repository
cd /home/yash/geeksdirectory.github.io || exit

# pull changes first

git pull

# Add all changes
git add .

# Commit with a generic message or pass a custom message as an argument
commit_message=${1:-"Automated commit"}
git commit -m "$commit_message"

# Push changes to the main branch
# Replace 'username' and 'token' with your credentials
username="yashbhangale"
token="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"
repo_url="https://$username:$token@github.com/geeksdirectory/geeksdirectory.github.io.git"

git push "$repo_url" main
