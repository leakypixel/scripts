p=$(git rev-parse --abbrev-ref HEAD)
git branch $1 && git checkout $1 && git push -u origin $1 && echo "$1 was branched from: $p" >> ~/.branch-parents
