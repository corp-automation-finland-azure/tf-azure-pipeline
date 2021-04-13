#!/bin/sh

CURRENT_BRANCH="$(git branch)"
if [[ "$CURRENT_BRANCH" -ne "master" ]]; then
        echo "Aborting script because you are not on the master branch."
        exit;      # I need to abort here!
fi

version=$1
releasedescription=$2

git tag -a $version -m "$releasedescription"
git push origin $version

