#!/usr/bin/env bash

function help:html {
  cat <<EOF

HTML commands:
  lint:html                   Lint HTML files and templates
EOF
}

function lint:html {
  local ignore_globs=(
    **/_build/**
    **/.elixir_ls/**
    **/.fetch/**
    **/.git/**
    **/.history/**
    **/cover/**
    **/deps/**
    **/doc/**
    **/node_modules/**
    **/npm_cache/**
    **/dialyzer/plts/**
  )

  local ignore_string="${ignore_globs[*]}"
  ignore_string="${ignore_string// /,}"

  npx htmlhint \
    --ignore "${ignore_string}" \
    "${@:-"**/*.{htm,html}"}"
}
