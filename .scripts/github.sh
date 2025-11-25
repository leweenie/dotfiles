#!/usr/bin/env bash

if git rev-parse --is-inside-work-tree &>/dev/null; then
    repo_url=$(git remote get-url origin)
    if [[ $repo_url =~ ^git@github.com: ]]; then
        repo_url="https://github.com/${repo_url#git@github.com:}"
    fi
    firefox "$repo_url" >/dev/null 2>&1 &
else
    echo "not inside a git repository"
fi
