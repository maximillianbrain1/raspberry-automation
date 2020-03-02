
#!/bin/bash
set -eux pipefail

SSH_KEY=$SSH_KEY_PATH

docker pull arminak89/packer-builder-arm

docker run \
  --privileged \
  -v ${PWD}:/build:ro \
  -v ${PWD}/packer_cache:/build/packer_cache \
  -v ${PWD}/output-arm-image:/build/output-arm-image \
  -e SSH_KEY="$SSH_KEY" \
  -e WIFI_NAME=$WIFI_NAME \
  -e WIFI_PASSWORD=$WIFI_PASSWORD \
  -e K3S_TOKEN=$K3S_TOKEN \
  -e K3S_NODEIP_MASTER=$K3S_NODEIP_MASTER \
  arminak89/packer-builder-arm build packer.json
