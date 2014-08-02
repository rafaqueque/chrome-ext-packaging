#!/bin/bash

echo "Initializing... Setting vars...";

git_dir=".git";
git_status=$(git status --long);
git_build=$(git tag | sort -r | head -1);
git_repo_name=${PWD##*/};
zip_file=$git_repo_name-$git_build.zip;

# Check if there's arguments
if [ $1 ]; then
  output_dir=$1;
else
  output_dir=$PWD;
fi;

# Check if the directory where the zip will be stored exists
if [ -d $output_dir ]; then
  echo "Zip destination dir: $output_dir";
else
  echo "Error: destination dir '$output_dir' not found. Exiting...";
  exit 1;
fi;

# Check if .git repo exists 
if [ -d $git_dir ]; then
  echo "Git '${PWD##*/}' repository found";
else
  echo "Error: Git repository '$git_repo_name' not found. Exiting... ";
  exit 1;
fi;

# Change current project to master branch
echo "Checkout 'master' branch on '$git_repo_name'. Build version: $git_build";
git checkout master >/dev/null 2>&1;

# Check if master branch has anything to commit 
if [[ $git_status == *'nothing to commit'* ]]; then
  echo "Nothing to commit on this branch";
else
  echo "Error: this repository has pending changes. Exiting...";
  exit 1;
fi;

# Generate zip file
git archive -o $output_dir/$zip_file -9 HEAD;

if [ -f $output_dir/$zip_file ]; then
  echo "File generated: $output_dir/$zip_file";
else
  echo "Error: cannot generate .zip file. Exiting...";
  exit 1;
fi;
