#!/bin/bash
set -e

DOCKER=docker
COMPOSE=docker-compose
COMPOSE_ENV_FILE=.env

project_init() {
    echo "Enter project name: "; read PROJECT_NAME
    mv project_name "$PROJECT_NAME"
    cp .env.default "$COMPOSE_ENV_FILE"
    sed --in-place s/PROJECT_NAME=project_name/PROJECT_NAME="$PROJECT_NAME"/ "$COMPOSE_ENV_FILE"
}

docker_up() {
    if [ $(${COMPOSE} ps | wc -l) -gt 2 ]; then
        echo "Running..."
       ${COMPOSE} start
    else
        echo "Creating and running..."
        ${COMPOSE} up -d
    fi
}

docker_down() {
    ${COMPOSE} down -v
}

docker_composer_run() {
    ${COMPOSE} run --rm composer $@
}

docker_container_shell() {
    COMMAND="${COMPOSE} run --rm --entrypoint /bin/bash $1"
    echo "$COMMAND"
    ${COMMAND}
}

CMD="$1"; shift

case ${CMD} in
    up) docker_up ;;
    down) docker_down ;;
    composer) docker_composer_run $@ ;;
    shell) docker_container_shell $@ ;;
    init) project_init $@ ;;
esac

exit $?