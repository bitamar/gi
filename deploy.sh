#!/usr/bin/env sh

# abort on errors
set -e

git stash
gco gh-pages

# build
yarn docs:build

# navigate into the build output directory
rm -rf dist/
cp -R docs/.vitepress/dist dist/

# if you are deploying to a custom domain
cd dist
# echo 'www.example.com' > CNAME

git add -A
git commit -m 'deploy'
git push -f origin gh-pages

cd -
gco -
