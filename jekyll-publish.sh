#!/usr/bin/env bash

git diff --quiet
if [[ $? -ne 0 ]] ; then
    echo "please commit before publishing"
    exit 1
fi



sudo docker run -it --rm --name=jekyll-publish \
     --volume=$(pwd):/srv/jekyll \
     koddo/jekyll \
     jekyll build --profile   # without --drafts



# the whole _site/ dir gets rewritten after jekyll build
cp README-master-branch.md _site/README.md
echo $(date) > _site/commit
echo $(git rev-parse --short --verify HEAD) > _site/commit



# cd _site
# git add --all && \
#     git -c "user.name=jekyll-publish" -c "user.email=NA" commit --allow-empty-message -am ''      # && git push


echo "ok, now please git commit and push manually"
