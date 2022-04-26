#!/bin/bash
BOLD='\x1b[1m'
NORMAL="\x1b[0m"
echo "::group::Workaround"
git config --global --add safe.directory /github/workspace
echo "::endgroup::"

set -e
token=$(eval echo "\$$GITHUB_ACTOR")
if [[ -z "$token" ]]
then
  echo -e "User $BOLD$GITHUB_ACTOR$NORMAL is not allowed to auto merge"
  if [[ "$INPUT_FAILS_IF_NOT_ENABLED" == "true" ]]
  then
    exit 1
  fi
else
  echo "::group::GitHub authentication"
    echo "$token" | gh auth login --with-token
    gh auth status
  echo "::endgroup::"
git status
  echo "::group::Configuring to auto merge"
    gh pr merge --auto --squash
  echo "::endgroup::"
fi
