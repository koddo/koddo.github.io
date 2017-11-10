#!/usr/bin/env bash

## https://stackoverflow.com/questions/7171725/open-new-terminal-tab-from-command-line-mac-os-x/8188174#8188174
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

vagrant ssh -c      'cd /vagrant-blog && docker build --tag koddo/jekyll - < Dockerfile'
tab "vagrant ssh -c 'cd /vagrant-blog &&             /vagrant-blog/jekyll-serve.sh 4000'"
tab "vagrant ssh -c 'cd /vagrant-blog &&             /vagrant-blog/jekyll-livereload.sh 35729'"
tab "vagrant ssh -c 'cd /vagrant-superlearn-wiki &&  /vagrant-blog/jekyll-serve.sh 4001'"
tab "vagrant ssh -c 'cd /vagrant-superlearn-wiki &&  /vagrant-blog/jekyll-livereload.sh 35730'"

open http://vagrant.local:4000/
open http://vagrant.local:4001/superlearn-wiki/

emacsclient -n /ssh:vagrant@vagrant.local:/vagrant-blog
