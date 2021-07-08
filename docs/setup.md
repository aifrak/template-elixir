# Setup development environment

## Install

1. Install [docker](https://docs.docker.com/get-docker/) 20.10.7+.
1. Install [docker-compose](https://docs.docker.com/compose/install/) 1.29.2+.

### Development with VSCode - Remote container (recommended)

1. Be sure to have the [minimum requirements](https://code.visualstudio.com/docs/remote/containers).
1. Install the extension `ms-vscode-remote.remote-containers`.
1. `Ctrl+Shift+P` and choose `Remote-Containers: Open Folder in Container...`
1. Wait container to be built (it takes a while).
1. Run `./run install-deps` to install all dependencies.
1. Run `./run help` to see all commands for this project.

### Development without VSCode

1. Run `./run --dev dc:console` to enter the container.
1. Run `./run install-deps` to install all dependencies.
1. Run `./run help` to see all commands for this project.

## UID and GID inside the container

You can change the user's UID/GID inside the container, you can export the
variables `USER_UID` and/or `USER_GID`.

```bash
export USER_UID=1000 USER_GID=1000; ./run dev:code
```

Note: On Linux, VSCode container handles user's UID/GID by itself. Read the
description of `remoteUser` and `updateRemoteUserUID` on this [page](https://code.visualstudio.com/docs/remote/devcontainerjson-reference#_devcontainerjson-properties).

## Known issues

1. `*.eex` files are not formatted or not correctly formatted in VSCode.
   **Answer**:`prettier-plugin-eex` supports `prettier` up to `2.2.x` only.
   **Temporary solution**: Run `./run elixir:eex:format` to format all `*.eex` files.
   ([more info](https://github.com/adamzapasnik/prettier-plugin-eex/issues/51))
   For this reason, two versions of `prettier` are installed with two `.prettierignore`:
   - `^2.3.x`:
     1. used for all accepted files but `*.eex` files
     1. uses `.prettierignore`
     1. used by VSCode
   - `~2.2.x`:
     1. used only for `*.eex`; all other extensions are excluded
     1. uses `.prettierignore-eex`, a copy from `.prettierignore` without
        ignoring `*.eex` files
     1. **not** used by VSCode

## FAQ

1. `husky` pre-commit is not triggered.
   **Solution**: Run `npm install`.
