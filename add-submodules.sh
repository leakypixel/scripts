for i in $(ls -RAd */**/**/);
do
  if [ -d "$i".git ]; then
    git submodule add ./$i ./$i
  fi
done
