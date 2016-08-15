#!/usr/bin/env bash

docker run -it --rm --name=jekyll \
    --volume=$(pwd):/srv/jekyll \
    my-jekyll \
    jekyll build   # without --drafts

# the whole _site/ dir gets rewritten after jekyll build
cp README-master-branch.md _site/README.md

cd _site
git add --all && \
    git commit --allow-empty-message -am '' && \
    git push origin master

