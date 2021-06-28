#!/usr/bin/env bash

function elixir:help {
  cat <<EOF

Elixir commands:
  elixir:format              Format Elixir files
  elixir:lint                Lint Elixir files
  elixir:test                Test Elixir files

Elixir EEx commands:
  elixir:eex:format          Format Embedded Elixir files
  elixir:eex:lint            Lint Embedded Elixir files
EOF
}

function elixir:lint {
  mix credo
  mix format --check-formatted
}

function elixir:format {
  mix format
}

function elixir:test {
  mix test
}

# Prettier 2.2 version for Embedded Elixir files
function prettier-eex {
  ./node_modules/prettier2.2/bin-prettier.js \
    --ignore-path=./.prettierignore-eex "${@}"
}

function elixir:eex:lint {
  prettier-eex --check .
}

function elixir:eex:format {
  prettier-eex --list-different --write .
}
