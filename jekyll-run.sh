#!/usr/bin/env bash

docker run -it --rm --name=jekyll-new \
    --volume=$(pwd):/srv/jekyll \
    koddo/jekyll \
    "$@"


## usage: $ ./jekyll-run.sh jekyll new site-name

