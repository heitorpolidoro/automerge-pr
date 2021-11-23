#!/bin/bash
BOLD='\x1b[1m'
NORMAL="\x1b[0m"

set -e
if [[ -n "$INPUT_ALLOWED_USERS" ]] && [[ ! " ${INPUT_ALLOWED_USERS[*]} " =~ " ${GITHUB_ACTOR} " ]]
then
  echo -e "User $BOLD$GITHUB_ACTOR$NORMAL is not allowed to auto-release"
else
  echo "::group::GitHub authentication"
    echo "$INPUT_PERSONAL_ACCESS_TOKEN" | gh auth login --with-token
  echo "::endgroup::"

  echo "::group::Configuring to auto merge"
  echo "::endgroup::"
fi
