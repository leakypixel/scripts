parent=$(git rev-parse --abbrev-ref HEAD)
git branch $1 && git checkout $1 && git push --set-upstream origin $1
echo "$1 was branched from $parent" >> ~/.branch-parents
