#!/bin/bash

github_organization="ricteam"

# Create automatically GitHub repositories
# Iterating over each folder in the current directory
for folder in */; do
  folder_name="${folder%/}"  # Remove trailing slash
  echo "Creating GitHub repository for folder: $folder_name"
  gh repo create "ricteam/$folder_name" --public -y

  # Navigate into the folder
  cd "$folder_name"

  # Initialize a Git repository
  git init
  git add .
  git commit -m "first commit"
  git branch -M main

  # Add the GitHub remote repository and push
  git remote add origin "git@github.com:$github_organization/$folder_name.git"
  git push -u origin main

  echo "Initialized Git repository, committed changes, and pushed to GitHub for folder: $folder_name"
  
  # Return to the parent directory
  cd ..
done