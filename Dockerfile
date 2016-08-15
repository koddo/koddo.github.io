from jekyll/jekyll

RUN apk add --update \
                     build-base \
                     ruby-dev \
    && rm -rf /var/cache/apk/*

RUN gem install \
                jekyll-tagging \
                guard \
                guard-livereload

