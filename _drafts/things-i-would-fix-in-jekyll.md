---
layout: post
title:  "Things I would fix in Jekyll"
date:   2017-05-16 18:55:08 +0300
tags:   []
comments: true
disqus_identifier: BC93E66B-A84F-43D7-B903-4F1B5F71DE85

---

I must have titles for links even if I just want to provide a relative link: `[/about](/about)`
`<about>` doesn't work, because it's indistinguashable from an html tag.

This makes it harder to use jekyll for wikis. You have to have discipline to write something like this:

```
[about]({{ site.baseurl }}{% link about.md %})
```

Emacs

