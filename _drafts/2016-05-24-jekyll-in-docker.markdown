---
layout: post
title:  "jekyll in docker"
date:   2016-05-24 19:03:34 +0300
tags:   [docker jekyll]
comments: true
disqus_identifier: 192B869A268-B68A-4829-8F5F-FED546C72732

---


https://hub.docker.com/r/jekyll/jekyll/

https://github.com/jekyll/docker/wiki/Usage:-Running#on-native-docker

{% highlight shell %}
$ docker run -it --rm --name=jekyll \
     --volume=$(pwd):/srv/jekyll \
     -p 127.0.0.1:4000:4000 \
     my-jekyll \
     jekyll serve
{% endhighlight %}



{% highlight shell %}
$ cat Dockerfile
from jekyll/jekyll
RUN gem install jekyll-tagging

$ docker build -t my-jekyll - < Dockerfile
{% endhighlight %}


asdf
asdf
asdf



without `mathjax: true`
fuck it: \\(\color{red}\sqrt{\color{black}\frac{1}{2}}\\)



fuck it
