#!/bin/bash

# Read Git repository URL from environment variable
REPO_URL=$GIT_REPO_URL

# Directory to clone the repository into
CLONE_DIR=/app/repository

# Clone the repository
git clone $REPO_URL $CLONE_DIR

# Error handling for cloning operation
if [ $? -ne 0 ]; then
  echo "Error: Failed to clone the repository"
  exit 1
fi

# Function to check for changes and pull if necessary
check_and_pull() {
  cd $CLONE_DIR
  git fetch origin
  CHANGES=$(git rev-list HEAD..origin/main --count)
  if [ $CHANGES -gt 0 ]; then
    echo "Detected $CHANGES new commit(s). Pulling changes..."
    git pull
    if [ $? -ne 0 ]; then
      echo "Error: Failed to pull changes from the repository"
    fi
  else
    echo "No new changes detected."
  fi
}

# Continuously monitor for changes
while true; do
  check_and_pull
  sleep 300 # Check every 5 minutes 
done
