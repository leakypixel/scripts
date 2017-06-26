(git rev-parse --abbrev-ref HEAD | grep -Eq  '^(feature|fix|documentation)/[a-z\-]+$') && exit 0 || exit 1
