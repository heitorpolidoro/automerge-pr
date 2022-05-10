# Autocreate Pull Request
![GitHub last commit](https://img.shields.io/github/last-commit/heitorpolidoro/automerge-pr)

[![Latest](https://img.shields.io/github/release/heitorpolidoro/automerge-pr.svg?label=latest)](https://github.com/heitorpolidoro/automerge-pr/releases/latest)
![GitHub Release Date](https://img.shields.io/github/release-date/heitorpolidoro/automerge-pr)

![GitHub](https://img.shields.io/github/license/heitorpolidoro/automerge-pr)

Set a Pull Request to Auto merge.

### Usage
```yaml
name: Automerge Pull Request

on:
  pull_request:
    types: [opened, reopened]


jobs:
  set-auto-merge:
    name: Set Pull Request do Automerge
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          ref: ${{ github.head_ref }}

      - name: Setting to Automerge
        uses: heitorpolidoro/automerge-pr@v1
        env:
          <user>: ${{ secrets.<USER_PERSONAL_ACCESS_TOKEN> }}
```
#### Optional parameters
- `fails_if_not_enabled`: Fails the run if the user is not enabled do set to auto merge

To enable a user to automatically creates a Pull Request set an `ENV` with the GitHub username passing the user Personal Access Token.