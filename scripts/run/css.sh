#!/usr/bin/env bash

css_globs="**/*.{css,less,sass,scss}"

function help:css {
  cat <<EOF

CSS commands:
  format:css          Format CSS, SCSS, SASS and LESS files
  lint:css            Lint CSS, SCSS, SASS and LESS
EOF
}

function lint:css {
  npx stylelint \
    --allow-empty-input \
    --color \
    --cache \
    "${@:-${css_globs}}"
}

function format:css {
  npx stylelint \
    --fix \
    --allow-empty-input \
    --color \
    --cache \
    "${@:-${css_globs}}"
}
