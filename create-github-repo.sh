curl -u 'leakypixel' https://api.github.com/user/repos -d '{"name":"${1}"}'
git remote add origin git@GitHub.com:leakypixel/${1}.git
