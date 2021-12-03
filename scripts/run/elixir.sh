#!/usr/bin/env bash

function elixir:help {
  cat <<EOF

Elixir commands:
  elixir:credo                Perform checks with Credo on Elixir files
  elixir:format               Format Elixir files
  elixir:format:lint          Check format on Elixir files
  elixir:lint                 Lint Elixir files
  elixir:lint:light           Lint Elixir files without credo and formatter
  elixir:test                 Test Elixir files
  elixir:version              Show Elixir version

Elixir EEx commands:
  elixir:eex:format           Format Embedded Elixir files
  elixir:eex:lint             Lint Embedded Elixir files

Erlang commands:
  erlang:format               Show Erlang version
EOF
}

# —————————————————————————————————————————————— #
#                     Elixir                     #
# —————————————————————————————————————————————— #

function elixir:lint {
  mix check \
    --only compiler \
    --only credo \
    --only dialyzer \
    --only doctor \
    --only formatter \
    --only unused_deps \
    --only sobelow
}

# The checks below are performed on the whole project.
# "lint-staged" passes file paths to "credo" and "formatter" which are excluded below.
function elixir:lint:light {
  mix check \
    --only compiler \
    --only dialyzer \
    --only doctor \
    --only unused_deps \
    --only sobelow
}

function elixir:credo {
  mix credo "${@}"
}

function elixir:format {
  mix format "${@}"
}

function elixir:format:lint {
  mix format --check-formatted "${@}"
}

function elixir:test {
  mix check --only ex_unit
}

function elixir:version {
  mix run \
    --no-compile \
    --no-deps-check \
    --no-archives-check \
    --no-mix-exs \
    --no-start \
    -e "IO.puts(System.version)"
}

# —————————————————————————————————————————————— #
#                   Elixir EEx                   #
# —————————————————————————————————————————————— #

# NOTE: Avoid error "No files matching the pattern were found" by adding prettierrc.yml
eex_glob="**/*.{eex,leex,prettierrc.yml}"

# Prettier 2.2 version for Embedded Elixir files
function prettier-eex {
  ./node_modules/prettier2.2/bin-prettier.js \
    --ignore-path=./.prettierignore-eex "${@}"
}

function elixir:eex:lint {
  prettier-eex --check "${@:-${eex_glob}}"
}

function elixir:eex:format {
  prettier-eex --list-different --write "${@:-${eex_glob}}"
}

# —————————————————————————————————————————————— #
#                     Erlang                     #
# —————————————————————————————————————————————— #

function erlang:version {
  erl -eval "{ok, Version} = file:read_file(filename:join([code:root_dir(), \
    'releases', erlang:system_info(otp_release), 'OTP_VERSION'])), \
    io:fwrite(Version), halt()." -noshell
}
