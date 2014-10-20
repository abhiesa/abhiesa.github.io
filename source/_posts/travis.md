title: My Travis Config
date: 2014-10-20 16:56:00
tags: ["Hexo", "github"] 
categories: Blogging
description: Auto publish to github, hexo blog
toc: false
---

#My Kind of Hello World
Travis Config to deploy hexo blog automatically using Travis-CI


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
- git clone --depth 1 --branch master --single-branch $DEPLOY_REPO . || (git init && git remote add -t master origin $DEPLOY_REPO)
- rm -rf ./*
- cp -r ../public/* .
- git add -A .
- git commit -m 'Auto Update from TRAVIS-CI'
- git branch -m master
- git push -q $DEPLOY_REPO HEAD:master
```
