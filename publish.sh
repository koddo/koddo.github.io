#!/usr/bin/env bash

cd _site && \
    git add --all && \
    git commit --allow-empty-message -am '' && \
    git push origin master

