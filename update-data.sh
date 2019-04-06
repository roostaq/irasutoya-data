#!/bin/sh

set -e
pwd

remote="https://$GH_TOKEN@github.com/roostaq/irasutoya-data.git"

git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name  "$GH_NAME" > /dev/null 2>&1

git remote add origin "$remote"

git add .
git commit -m "Monthly data update $(date +"%T")"

git push --force --quiet origin master > /dev/null 2>&1

echo "Finished!"
