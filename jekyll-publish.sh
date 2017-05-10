#!/usr/bin/env bash

docker run -it --rm --name=jekyll-publish \
    --volume=$(pwd):/srv/jekyll \
    koddo/jekyll \
    jekyll build   # without --drafts

# the whole _site/ dir gets rewritten after jekyll build
cp README-master-branch.md _site/README.md
echo $(date) >> _site/commit
echo $(git rev-parse --short HEAD) >> _site/commit

cd _site
git add --all && \
    git commit --allow-empty-message -am '' && \
    git push

