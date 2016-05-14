#!/usr/bin/env bash

docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it jekyll/jekyll jekyll build --watch --verbose
