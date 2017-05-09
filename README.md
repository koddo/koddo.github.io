# blog

https://koddo.github.io/

## how to write a new post

Create a markdown file in _drafts:
M-x ym-jekyll-post-template
...
M-x ym-jekyll-regenerate-date-and-filename

## how to use

Before the first run create an image with installed gems:

```
$ docker build --tag koddo/jekyll - < Dockerfile
```

Then:

```
$ ssh -t alex@debian.local "cd ~/mnt/koddo.github.io && ./jekyll-serve.sh"
$ cd ~/Dropbox/ && python3 -m http.server 4001
$ open -a Firefox http://jekyll.dev.dnsdock:4000/

$ ./jekyll-publish.sh
```



the `_site/` dir contains the master branch of this repo, `_site/.git` is in keep_files in _config.yml

```
$ git clone git@github.com:koddo/koddo.github.io.git
$ mv koddo.github.io _site
```

## livereload

in a second terminal tab:

```
$ ssh -t alex@debian.local "cd ~/mnt/koddo.github.io && ./jekyll-livereload.sh"
```



# misc

## setup

disqus
mathjax
https://github.com/pattex/jekyll-tagging
https://github.com/bryanbraun/anchorjs
https://github.com/guard/guard-livereload, http://stackoverflow.com/questions/8395526/using-live-reload-with-jekyll

kramdown ToC

my customizations:
collection index with links to collection pages
collection page with a link to index
site map



TODO: tag_page, tag_feed layout
TODO: add ditaa plugin
TODO: indent my liquid templates
TODO: footnotes

TODO: html5 tags for accessibility: contents, navigation, etc

TODO: add sitemap.xml generator
TODO: add https://github.com/inukshuk/jekyll-scholar

TODO: http://hamishwillee.github.io/2014/11/13/jekyll-includes-are-functions/
TODO: make sure everything is ok with my links --- http://downtothewire.io/2015/08/15/configuring-jekyll-for-user-and-project-github-pages/
TODO: only include mathjax on pages with math=true 

TODO: move ToC to layout
TODO: excerpt_separator --- http://stackoverflow.com/questions/16422933/how-do-i-use-markdownify-in-jekyll-to-show-an-excerpt-on-the-index/18007879#18007879

show comments
====================

it's a slightly modified disqus script
the main difference is the function which appends script to the body is called on click

TODO: the show comments button is named "Any comments?" -- find a better name
TODO: make the show comments button less bright, less visible
TODO: on noscript make the show comments button redirect to the disqus site with comments
TODO: attach the disqus logo to the button: https://disqus.com/brand/

# new site

```
outside$ # create and clone site-name
outside$ ./jekyll-run.sh jekyll new site-name
outside$ cd site-name
$ git add --all && git commit -am 'jekyll new'

$ # clone site-name to ./_site dir, jekyll publishes everything into it
$ cd _site
_site$ git checkout --orphan gh-pages
_site$ git rm -rf .

_site$ cd ..
$ # jekyl build
$ cd _site
_site$ git add --all && git commit --allow-empty-message -am ''
```
