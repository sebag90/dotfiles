# General

Unless explicitly asked to, do not modify any file just yet. Any request that does not explicitly ask to implement something must be considered as brainstorming.

# Environment

To ensure isolation, you are running inside a podman container, but the network is mapped to host, so you can serve any web server on 0.0.0.0 and I'll be able to see it on the assigned port.
Moreover, docker is mapped to the podman executable which is connected to the host's socket, so you have access to rootless podman on the developer's machine.

# Developer's tools

These are some tools I often use while developing and will most likely ask you to include:

## Justfile

Always include a very minimalistic Justfile to execute commands (such as just db, just frontend, just backend and so on).  
If `just` is run without arguments, it should default to `just --list`.
Do not overdue with the just commands, only the ones that are truly needed or requested.
Justfiles should always include a `just up` and `just down` commands to start and stop the project locally.


## Podman

Whenever possible, I want to use tools, or launch a demo server directly from podman like this command:
`podman run --rm alpine sh -c "apk add --no-cache pwgen >/dev/null 2>&1 && pwgen 60 -cn"` to run pwgen instead of installing it directly on my machines.
This should be the standard (whenever possible) even in just commands that might invoke some tools (like htpasswd).

While developing, I don't like to run servers natively, instead I often add a just fommand like the following

```Justfile
demo:
    podman run -it --rm \
        --env-file .env \
        -p 8080:8080 \
        -v ./data:/data \
        -e DATA_DIR=/data \
        ${IMAGE_NAME}:demo

backend:
    podman run --rm --env-file .env \
        -p 8000:8080 \
        -v ./:/app:z \
        -it ${IMAGE_NAME}:dev-venv
```

This way I do not have to worry about UV creating virtual environment in my host machine or server not stopping and blocking ports.
Everything is run in isolation inside a container, everything can be stopped with podman.

## Containerfile

I like using podman and containers, this is an example of Containerfiles in my tipical workflow:
My goal is to use multistaging builds to ensure that no unnecessary

```Dockerfile
ARG INSTALLER_VENV_PATH=/opt/venv
ARG WORKDIR=/app
ARG BASE_IMAGE=ghcr.io/astral-sh/uv:python3.13-bookworm-slim

FROM $BASE_IMAGE as dev-venv
ARG WORKDIR
ARG INSTALLER_VENV_PATH

ENV VIRTUAL_ENV=$INSTALLER_VENV_PATH \
  UV_PROJECT_ENVIRONMENT=$INSTALLER_VENV_PATH \
  UV_COMPILE_BYTECODE=1

WORKDIR $WORKDIR

# Basic image containing all the dependencies - used for testing in development
COPY pyproject.toml uv.lock README.md ./
RUN uv sync --frozen --no-dev --group demo --no-install-project
CMD ["uv", "run", "uvicorn", "chat_with_project.api:app", "--host", "0.0.0.0", "--port", "8080"]

# production image installs the package in non editable mode (aka. directory src/ is not needed on the final image)
FROM dev-venv as prod-venv
COPY src src/
RUN uv sync --frozen --no-dev --group demo --no-editable

# production image, copy the virtual env, set path and cmd
FROM $BASE_IMAGE as prod-runner
ARG INSTALLER_VENV_PATH

RUN mkdir $INSTALLER_VENV_PATH

COPY --from=prod-venv $INSTALLER_VENV_PATH $INSTALLER_VENV_PATH

ENV PATH="${INSTALLER_VENV_PATH}/bin:$PATH"
CMD ["uvicorn", "chat_with_project.api:app", "--host", "0.0.0.0", "--port", "8080"]

# build on prod runner image by adding the demo and set cmd to serve the demo frontend
FROM prod-runner as demo
ARG WORKDIR
WORKDIR $WORKDIR
COPY demo ./demo
CMD ["uvicorn", "web:app", "--app-dir", "demo", "--host", "0.0.0.0", "--port", "8080"]
```

# Preferences

These are some of my preferences regarding tools or programming languages.

## Container

- Podman over Docker
- Quadlet files over docker compose
- Multistaging with clear separation of the environment and data stages. Final stage should be as minimal as possible.

## Python

- pathlib.Path
- I like using generators when possible instead of lists
