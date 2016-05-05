#!/usr/bin/env bash

grep -rl --include=*.scss "#[a-fA-F0-9]\{3\}[ ;]" | xargs sed -i "s/#\([a-fA-F0-9]\)\([a-fA-F0-9]\)\([a-fA-F0-9]\)\([; ]\)/#\1\1\2\2\3\3\4/g"
grep -rl --include=*.scss "#[a-fA-F0-9]\{6\}[ ;]" | xargs sed -i "s/#[a-fA-F0-9]\{6\}[; ]/\L&/g"
