#!/bin/bash

set -eEo pipefail

compose_cmd=${COMPOSE_CMD:-'podman-compose'}

$compose_cmd down
$compose_cmd up --build -d --remove-orphans
