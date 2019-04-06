#!/bin/sh

set -e
pwd

touch test

git add .
git commit -m "Monthly data update $(date +"%T")"

git push --force --quiet origin master 
