FROM aifrak/elixir:1.11.3-23.2.7-erlang-buster-slim as build-elixir
FROM build-elixir AS build-dev

USER root

# Install dependencies
RUN set -ex \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -qq --yes --no-install-recommends \
  ca-certificates=* \
  git=1:2.20.1-* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install development environment
RUN set -ex \
  && export DEBIAN_FRONTEND=noninteractive \
  && VERSION="v0.1.2" \
  && DEV_ENV_DIR=/tmp/dev-env \
  && git clone --quiet --single-branch --depth 1 --branch $VERSION \
  https://github.com/aifrak/dev-env.git $DEV_ENV_DIR \
  && $DEV_ENV_DIR/install "$APP_USER" --dependencies --zsh --dockerfile --elixir \
  && rm -rf $DEV_ENV_DIR \
  && apt-get clean

USER $APP_USER

CMD ["zsh"]
