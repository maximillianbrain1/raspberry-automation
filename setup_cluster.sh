#!/bin/bash
HOST_IP = $(ifconfig | grep -a2 wlp7s0 | grep "inet " | cut -d ' ' -f 10)
K3S_NODEIP_MASTER=$HOST_IP:6443

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -

K3S_TOKEN="$(sudo cat /var/lib/rancher/k3s/server/node-token)"

cat $K3S_TOKEN >> .K3S_TOKEN
