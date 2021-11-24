#!/bin/bash
BOLD='\x1b[1m'
NORMAL="\x1b[0m"

set -e
token=$(eval echo "\$$GITHUB_ACTOR")
if [[ -z "$token" ]]
then
  echo -e "User $BOLD$GITHUB_ACTOR$NORMAL is not allowed to auto merge"
else
  echo "::group::GitHub authentication"
    echo "$token" | gh auth login --with-token
    gh auth status
  echo "::endgroup::"
env
git checkout "$GITHUB_HEAD_REF"
git status
  echo "::group::Configuring to auto merge"
    gh pr merge --auto --squash
  echo "::endgroup::"
fi
