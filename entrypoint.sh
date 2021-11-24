#!/bin/bash
BOLD='\x1b[1m'
NORMAL="\x1b[0m"

set -e
token=$(eval echo "\$$GITHUB_ACTOR")
echo "#$token#"
if [[ -z "$token" ]]
then
  echo -e "User $BOLD$GITHUB_ACTOR$NORMAL is not allowed to auto merge"
else
  echo "::group::GitHub authentication"
    echo "$token" | gh auth login --with-token
  echo "::endgroup::"

  echo "::group::Configuring to auto merge"
  echo "::endgroup::"
fi
