files=$(git status | grep "both modified" | sed s/both\ modified://gi | sed s/\\s//gi)

for file in $files; do
  git checkout origin/master $file
done
