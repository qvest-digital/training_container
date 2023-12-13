#!/bin/bash

set -eEo pipefail


compose_cmd=${COMPOSE_CMD:-'podman-compose'}

$compose_cmd down
WORKSHOP=${1:?"\$1 no workshop choosen set to: kubernetes, container"}; $compose_cmd up --build --remove --remove-orphans
