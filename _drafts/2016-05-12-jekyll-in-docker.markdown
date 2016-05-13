---
title:  "jekyll in docker"
date:   2016-05-12 12:18:44 +0000
layout: post
tags:   docker jekyll
---



https://hub.docker.com/r/jekyll/jekyll/

https://github.com/jekyll/docker/wiki/Usage:-Running#on-native-docker

{% highlight shell %}
$ docker run -it --rm --name=jekyll \
     --volume=$(pwd):/srv/jekyll \
     -p 127.0.0.1:4000:4000 \
     my-jekyll-image \
     jekyll serve
{% endhighlight %}



{% highlight shell %}
$ cat Dockerfile
from jekyll/jekyll
RUN gem install jekyll-tagging

$ docker build -t my-jekyll-image - < Dockerfile
{% endhighlight %}
