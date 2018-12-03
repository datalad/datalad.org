#!/bin/bash
# use travis-encrypted GitHub token and git user for updating output/
# whenever master branch is updated.

# It assumes that `make html` was performed beforehand and thus output/ is
# up-to-date.

printf 'Running GitHub Pages deployment script.\n'

set -x
git --version

# set up git and GitHub access
git config user.name 'AutoBuild'
git config user.email 'blackhole@datalad.org'
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:x-oauth-basic@github.com" > .git/credentials

# switch to branch gh-pages and get the fresh build
git remote set-branches --add origin gh-pages
git fetch origin
git branch -a
git checkout origin/gh-pages
rsync -r output/ .

# commit new docs folder and push
git add .
git commit -m "Automatically updated GitHub pages"
git push origin HEAD:gh-pages

rm .git/credentials
