# Template Elixir

This is a template repository for Elixir projects.

[![Dockerfile lint](https://github.com/aifrak/template-elixir/actions/workflows/dockerfile-lint.yml/badge.svg)](https://github.com/aifrak/template-elixir/actions/workflows/dockerfile-lint.yml)
[![Markdown lint](https://github.com/aifrak/template-elixir/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/aifrak/template-elixir/actions/workflows/markdown-lint.yml)
[![GitHub](https://img.shields.io/github/license/aifrak/template-elixir?color=blue)](https://github.com/aifrak/template-elixir/blob/master/LICENSE)

## Requirement ❗

- Elixir: 1.11+
- Erlang: 23.2+

OR

- Docker
- Docker compose

## How to access the project with Docker ❓

### With "VSCode - Remote Container" extension

1. Download the VSCode extension `ms-vscode-remote.remote-containers`.

2. CTRL + P and search for `Open folder in Container`.

3. When asked a folder, choose the current folder.

4. Run `iex -S mix` to access the Elixir shell.

### Without VSCode

1. Run `make docker-build-up` to build and start the container.

2. Run `make app-access` to access the Elixir container shell.

3. Run `iex -S mix` to access the Elixir shell.
