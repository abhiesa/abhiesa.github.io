title: My Travis Config
date: 2014-10-20 16:56:00
tags: plugins
categories: Hexo
description: Travis Config for Hexo
toc: false
---
# My Travis Config

```
language: node_js
node_js:
  - "0.10"
branches:
  only:
  - source
before_install:
- npm install -g hexo
install:
- npm install
before_script:
- git config --global user.name 'Abhishek Prashant Pandey'
- git config --global user.email 'abhiesa@gmail.com'
script:
- hexo generate
after_success:
- mkdir .deploy
- cd .deploy
- git clone --depth 1 --branch master --single-branch $DEPLOY_REPO . || (git init && git remote add -t gh-pages origin $DEPLOY_REPO)
- rm -rf ./*
- cp -r ../public/* .
- git add -A .
- git commit -m 'Site updated'
- git branch -m source
- git push -q -u origin source
```
