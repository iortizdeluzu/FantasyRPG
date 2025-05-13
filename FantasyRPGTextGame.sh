#!/bin/sh
echo -ne '\033c\033]0;FantasyRPGTextGame\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/FantasyRPGTextGame.x86_64" "$@"
