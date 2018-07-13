# my blog

https://koddo.github.io/

## how to clone

The `_site/` dir should contain the master branch of this repo, `_site/.git` is in keep_files in _config.yml

```
$ git clone git@github.com:koddo/koddo.github.io.git blog
$ cd blog
blog$ git checkout jekyll-source
blog$ git clone git@github.com:koddo/koddo.github.io.git _site
```

## how to use

Before the first run create an image with installed gems:

```
$ docker build --tag koddo/jekyll - < Dockerfile
```

Then:

```
$ ssh -t alex@debian.local "cd ~/mnt/koddo.github.io && ./jekyll-serve.sh --incremental"
$ cd ~/Dropbox/ && python3 -m http.server 4001
$ open -a Firefox http://jekyll.dev.dnsdock:4000/

$ ./jekyll-publish.sh
```

## how to write a new post in emacs

Create a markdown file in _drafts:
M-x ym-jekyll-post-template
...
M-x ym-jekyll-regenerate-date-and-filename

## livereload

in a second terminal tab:

```
$ ssh -t alex@debian.local "cd ~/mnt/koddo.github.io && ./jekyll-livereload.sh"
```

## summary

`run.sh` opens tabs and runs both jekyll and livereload. 


# misc

The only thing bothers me with this image, jekyll runs as root, we can't run it as user by whatever reason.

## configuration

`livereload_script` var is declared in _config_dev.yml.
If you'd like to have local configuration variables, set them in _config_local.yml, it's gitignored.

`superlearn_url` in dev environment is also set to `superlearn.localhost`, which should resolve to localhost as per [rfc6761](https://tools.ietf.org/html/rfc6761). Add an entry `127.0.0.1	superlearn.localhost` to `/etc/hosts`.
I personally run it in a vm, so for me `superlearn_url` is `http://local-vm.superlearn.it`, and the `/etc/hosts` entry is `172.28.128.3	local-vm.superlearn.it`

## setup

disqus
mathjax, used only where `page.mathjax` is true
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

TODO: add sitemap.xml generator -- https://github.com/jekyll/jekyll-sitemap
TODO: add https://github.com/inukshuk/jekyll-scholar

TODO: http://hamishwillee.github.io/2014/11/13/jekyll-includes-are-functions/
TODO: make sure everything is ok with my links --- http://downtothewire.io/2015/08/15/configuring-jekyll-for-user-and-project-github-pages/

TODO: move ToC to layout
TODO: excerpt_separator --- http://stackoverflow.com/questions/16422933/how-do-i-use-markdownify-in-jekyll-to-show-an-excerpt-on-the-index/18007879#18007879

three alphabets of lucida grande is approx 640 px 

TODO: <https://wiredcraft.com/blog/make-jekyll-fast/>

TODO: set defaults for pages -- <https://jekyllrb.com/docs/configuration/#front-matter-defaults>

# show comments

it's a slightly modified disqus script
the main difference is the function which appends script to the body is called on click

TODO: the show comments button is named "Any comments?" -- find a better name
TODO: make the show comments button less bright, less visible
TODO: on noscript make the show comments button redirect to the disqus site with comments
TODO: attach the disqus logo to the button: https://disqus.com/brand/

# how to create new site

TODO: find a better place for this text

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


