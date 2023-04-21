#!/bin/bash

set -eEo pipefail

podman-compose down 

podman build shells/shellinabox1 -t local/shellinabox

podman-compose up -d --remove-orphans
