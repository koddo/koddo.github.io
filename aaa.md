---
layout: page
title:  AAA

---

TODO: page updated date

# clojurescript, re-frame

``` Shell
$ [[ ! -f download ]] && wget https://gist.github.com/koddo/c5f2b74d9f33e023f02cf735b66a4127/download && unzip -j download && rm download
$ docker-compose --project-name theproject run --rm --no-deps figwheel lein new re-frame theproject --to-dir . -- +cider +routes +re-frisk
$ docker-compose --project-name theproject run --rm --no-deps figwheel lein deps
$ docker-compose --project-name theproject run --rm --no-deps gulp npm install
$ mkdir less && mkdir resources/public/css && cat <<EOF > less/site.less
body {
    color:red;
}
EOF
```

top figwheel conf: `:repl false :nrepl-port 7888`
figwheel section of dev build configuration in project.clj: `:websocket-host :js-client-host`
head of `index.html`: `<link href="css/site.css" rel="stylesheet" type="text/css">`

</ssh:alex@debian.local:~/>
if you want polling instead of fsevents, add this to the top figwheel conf: `:hawk-options {:watcher :polling}`

``` Shell
docker-compose --project-name theproject up
```

<http://theproject_figwheel.dev.dnsdock:3449/>

## notes

Sticking to safe options and using gulp to generate `css` from `less`, `lein-less` has to be run separately anyway.

TODO: re-frame template `+test`, usage
TODO: nginx https termination, nginx static files

## gist

<script src="https://gist.github.com/koddo/28186b849ffeed5a56f1c91464b05901.js"></script>




# another way: clojurescript, re-frame

see changes
<https://github.com/Day8/re-frame-template/search?q=lein-template>
<https://clojars.org/re-frame/lein-template>
<https://github.com/Day8/re-frame-template/releases>
<https://github.com/Day8/re-frame-template/compare/v0.2.2-7...v0.2.4>

<http://www.inoreader.com/folder/updates%20--%20cljs>


``` Shell
$ git clone --origin boilerplate repo.git
$ git remote add origin ssh://git@github.com/user/new_proj.git
```


