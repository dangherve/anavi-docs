#!/bin/bash
git remote add upstream https://github.com/AnaviTechnology/anavi-docs.git
git fetch upstream
git rebase upstream/main
git remote set-url origin git@github.com:dangherve/anavi-docs.git
git push --force --set-upstream origin master
