#!/usr/bin/env bash

cp README-master-branch.md _site/README.md && \
    cd _site && \
    git add --all && \
    git commit --allow-empty-message -am '' && \
    git push origin master

