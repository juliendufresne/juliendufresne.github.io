# Managing your jekyll site with docker

Docker allows you to use some software without the need to install all its requirements.

## Create a new blog site

Enter to the directory of your choice then run

```bash
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it jekyll/jekyll jekyll new .
```

## Build site from source

use the `--watch` option if you are actively editing

```bash
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it jekyll/jekyll jekyll build
```
