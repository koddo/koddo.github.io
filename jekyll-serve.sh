#!/usr/bin/env bash

## https://github.com/jekyll/docker

## please make sure listening to 0.0.0.0 is ok in your environment

NAME=jekyll_$(basename $(pwd))
PORT=${1:-4000}

touch -a _config_local.yml

sudo docker run -it --rm --name="$NAME" \
     --volume=$(pwd):/srv/jekyll \
     -p 0.0.0.0:$PORT:4000 \
     --env JEKYLL_ENV=development \
     koddo/jekyll \
     jekyll serve \
     --profile \
     --drafts \
     --config _config.yml,_config_dev.yml,_config_local.yml

     # --incremental \
     # --force_polling
     # --user=jekyll \


# JEKYLL_ENV=development jekyll build
# and then {% if jekyll.environment == "development" %}
