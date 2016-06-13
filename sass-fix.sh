files=$(find . -name *.scss)
for file in $files; do
  sass-convert -i $file;
done
