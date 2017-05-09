#!/usr/bin/env bash

## https://github.com/jekyll/docker

## please make sure listening to 0.0.0.0 is ok in your environment

docker run -it --rm --name=jekyll-livereload \
    --volume=$(pwd):/srv/jekyll \
    -p 0.0.0.0:35729:35729 \
    koddo/jekyll \
    guard

