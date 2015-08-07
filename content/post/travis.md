+++
title = "Hexo Travis Config"
description = "Auto publish to github, hexo blog"
tags = [ "github" ]
date = "2014-10-20T16:56:00+05:30"
categories = ["Blogging"]
keywords = ["Hexo", "github", "Blogging"]
slug = "hexo-travis-config"
draft = false
+++

#My Kind of Hello World

Travis Config to deploy hexo blog automatically using Travis-CI

```yaml
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