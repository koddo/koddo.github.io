#!/usr/bin/env bash

## https://github.com/jekyll/docker

## please make sure listening to 0.0.0.0 is ok in your environment

NAME=jekyll_$(basename $(pwd))
PORT=${1:-4000}

docker run -it --rm --name="$NAME" \
    --volume=$(pwd):/srv/jekyll \
    -p 0.0.0.0:$PORT:4000 \
    --env JEKYLL_ENV=development \
    koddo/jekyll \
    jekyll serve \
    --profile \
    --drafts \
    --incremental \
    --config _config.yml

    # --force_polling

# --config _config.yml,_config_livereload.yml
# now we check {% if site.livereload %}
# we can do this using environment variable
# JEKYLL_ENV=development jekyll build
# and then {% if jekyll.environment == "development" %}
