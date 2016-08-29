#!/usr/bin/env bash

## https://github.com/jekyll/docker

## please make sure listening to 0.0.0.0 is ok in your environment

docker run -it --rm --name=jekyll \
    --volume=$(pwd):/srv/jekyll \
    -p 0.0.0.0:4000:4000 \
    my-jekyll \
    jekyll serve --drafts \
    --config _config.yml,_config_livereload.yml \
    --force_polling   # for macosx

# was -p 0.0.0.0:4000:4000 \
    
# now we check {% if site.livereload %}
# we can do this using environment variable
# JEKYLL_ENV=production jekyll build
# and then {% if jekyll.environment == "production" %}
