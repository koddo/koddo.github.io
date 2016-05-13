# blog

https://koddo.github.io/

## how to publish

```
$ ssh -t alex@debian.local "cd ~/mnt/koddo.github.io && ./jekyll-serve.sh"
$ ./publish.sh
```

before the first run create an image with installed gems

```
$docker build -t my-jekyll-image - < Dockerfile
```

the _site/ dir contains the master branch of this repo, _site/.git is in keep_files in _config.yml

```
$ git clone git@github.com:koddo/koddo.github.io.git
$ mv koddo.github.io _site
```



misc
=======================

TODO: tag_page, tag_feed layout
