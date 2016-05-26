#!/usr/bin/env bash
comparison_base=$(find $1 -type f)
for file in $comparison_base; do
  file_to_compare=$(echo $file | sed s/$1/$2/gi)
  diff -q $file $file_to_compare
done
