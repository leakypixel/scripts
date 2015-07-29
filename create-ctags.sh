#!/bin/bash 

if [ -z $1 ]; then
  tags_dir="./.git/tags";
else
  tags_dir=$1;
fi

echo $tags_dir
mkdir -p $tags_dir

ctags -R -f $tags_dir .
