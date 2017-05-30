#!/usr/bin/env bash

## https://github.com/jekyll/docker

## please make sure listening to 0.0.0.0 is ok in your environment

NAME=jekyll_livereload_$(basename $(pwd))
PORT=${1:-35729}

docker run -it --rm --name="$NAME" \
    --volume=$(pwd):/srv/jekyll \
    -p 0.0.0.0:$PORT:35729 \
    koddo/jekyll \
    guard

