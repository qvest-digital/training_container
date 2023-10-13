#!/bin/bash

set -eEo pipefail

podman-compose down
podman-compose up --build -d --remove-orphans

