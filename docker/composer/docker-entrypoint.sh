#!/bin/bash

if [ -v "GITHUB_OAUTH_TOKEN" ]; then
	composer config -g github-oauth.github.com $GITHUB_OAUTH_TOKEN
fi

exec composer "$@"