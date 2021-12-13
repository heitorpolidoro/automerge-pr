# Autocreate Pull Request
![GitHub last commit](https://img.shields.io/github/last-commit/heitorpolidoro/automerge-pr)
[![Create GitHub Release](https://github.com/heitorpolidoro/automerge-pr/actions/workflows/auto-release.yml/badge.svg)](https://github.com/heitorpolidoro/automerge-pr/actions/workflows/auto-release.yml)

[![Latest](https://img.shields.io/github/release/heitorpolidoro/automerge-pr.svg?label=latest)](https://github.com/heitorpolidoro/automerge-pr/releases/latest)
![GitHub Release Date](https://img.shields.io/github/release-date/heitorpolidoro/automerge-pr)

![GitHub](https://img.shields.io/github/license/heitorpolidoro/automerge-pr)

Action to create a pull request automatically.

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
To enable a user to automatically creates a Pull Request set an `ENV` with the GitHub username passing the user Personal Access Token