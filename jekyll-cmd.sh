#!/usr/bin/env bash

sudo docker run -it --rm --name=jekyll-new \
     --volume=$(pwd):/srv/jekyll \
     --user=jekyll \
     koddo/jekyll \
     "$@"


## usage: $ ./jekyll-run.sh jekyll new site-name

