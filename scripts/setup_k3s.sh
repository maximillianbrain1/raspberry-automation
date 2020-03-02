#!/bin/bash
set -ex

wget https://github.com/rancher/k3s/releases/download/v1.17.3%2Bk3s1/k3s-armhf
chmod +x k3s-armhf
mv k3s-armhf /usr/local/bin/k3s-armhf

sed '/exit 0/d' -i /etc/rc.local

echo "appending the command below to /etc/rc.local:"
echo "sudo k3s-armhf agent --token="$K3S_TOKEN" --server=https://$K3S_NODEIP_MASTER --with-node-id &"

echo "sudo k3s-armhf agent --token="$K3S_TOKEN" --server=https://$K3S_NODEIP_MASTER --with-node-id &" >> /etc/rc.local
