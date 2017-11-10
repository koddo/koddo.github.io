from jekyll/jekyll

RUN apk add --update \
                     build-base \
                     ruby-dev \
    && rm -rf /var/cache/apk/*

RUN gem install \
                jekyll-feed \
                jekyll-tagging \
                guard guard-livereload \
                github-pages

## github-pages gem is for supported themes: https://pages.github.com/themes/


## this doesn't work
# USER jekyll
