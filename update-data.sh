#!/bin/sh

set -e
pwd

remote="https://$GH_TOKEN@github.com/roostaq/irasutoya-data.git"

rm -rf .git

mkdir commit
cp ./* commit/.
cd commit

git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name  "$GH_NAME" > /dev/null 2>&1
git init

git add .
git commit -m "Monthly data update $(date +"%T")"
git remote add origin "$remote"
git push --force --quiet origin master:master > /dev/null 2>&1

cd ..
rm -rf commit

echo "Finished!"
