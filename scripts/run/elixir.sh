#!/usr/bin/env bash

function help:elixir {
  cat <<EOF

Elixir commands:
  format:elixir       Format Elixir files
  lint:elixir:credo   Perform checks with Credo on Elixir files
  lint:elixir:format  Check format on Elixir files
  lint:elixir         Lint Elixir files
  lint:elixir:light   Lint Elixir files without credo and formatter
  test:elixir         Test Elixir files
  version:elixir      Show Elixir version

Erlang commands:
  version:erlang      Show Erlang version
EOF
}

# —————————————————————————————————————————————— #
#                     Elixir                     #
# —————————————————————————————————————————————— #

function lint:elixir {
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
# "lint:staged" passes file paths to "credo" and "formatter" which are excluded below.
function lint:elixir:light {
  mix check \
    --only compiler \
    --only dialyzer \
    --only doctor \
    --only unused_deps \
    --only sobelow
}

function lint:elixir:credo {
  mix credo "${@}"
}

function format:elixir {
  mix format "${@}"
}

function lint:elixir:format {
  mix format --check-formatted "${@}"
}

function test:elixir {
  mix check --only ex_unit
}

function version:elixir {
  mix run \
    --no-compile \
    --no-deps-check \
    --no-archives-check \
    --no-mix-exs \
    --no-start \
    -e "IO.puts(System.version)"
}

# —————————————————————————————————————————————— #
#                     Erlang                     #
# —————————————————————————————————————————————— #

function version:erlang {
  erl -eval "{ok, Version} = file:read_file(filename:join([code:root_dir(), \
    'releases', erlang:system_info(otp_release), 'OTP_VERSION'])), \
    io:fwrite(Version), halt()." -noshell
}
