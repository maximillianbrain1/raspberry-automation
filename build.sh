
#!/bin/bash
set -eux pipefail


WIFI_NAME=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2 | cut -d":" -f2)
WIFI_PASSWORD=$(sudo cat /etc/NetworkManager/system-connections/$WIFI_NAME | grep psk=  | cut -d"=" -f2)
SSH_KEY=$(cat $HOME/.ssh/id_rsa.pub)


HOST_IP=$(ifconfig | grep -a2 wlp7s0 | grep "inet " | cut -d ' ' -f 10)
K3S_NODEIP_MASTER=$HOST_IP:6443

K3S_TOKEN="$(cat .k3s_token)"


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

echo "run sudo ./flasher -image=./output-arm-image/image -device=/dev/sdb"
echo "run export KUBECONFIG=\"/etc/rancher/k3s/k3s.yaml\" to get the right kubectl context"
