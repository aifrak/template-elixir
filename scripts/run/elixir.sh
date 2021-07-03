#!/usr/bin/env bash

function elixir:help {
  cat <<EOF

Elixir commands:
  elixir:format              Format Elixir files
  elixir:lint                Lint Elixir files
  elixir:test                Test Elixir files
  elixir:version             Show Elixir version

Elixir EEx commands:
  elixir:eex:format          Format Embedded Elixir files
  elixir:eex:lint            Lint Embedded Elixir files

Erlang commands:
  erlang:format              Show Erlang version
EOF
}

# ---------------------------------------------- #
#                     Elixir                     #
# ---------------------------------------------- #

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

function elixir:version {
  mix run --no-mix-exs -e "IO.puts(System.version)"
}

# ---------------------------------------------- #
#                   Elixir EEx                   #
# ---------------------------------------------- #

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

# ---------------------------------------------- #
#                     Erlang                     #
# ---------------------------------------------- #

function erlang:version {
  erl -eval "{ok, Version} = file:read_file(filename:join([code:root_dir(), \
    'releases', erlang:system_info(otp_release), 'OTP_VERSION'])), \
    io:fwrite(Version), halt()." -noshell
}
