#!/bin/bash

KUBERNETES_VERSION=v1.22.17
MASTER_IP=100.64.0.5
VPN_IP=100.64.0.30
K3S_MASTER_TOKEN=secret

export INSTALL_K3S_VERSION=${KUBERNETES_VERSION}+k3s1
curl -sfL https://get.k3s.io | K3S_URL=https://${MASTER_IP}:6443 \
  K3S_TOKEN=${K3S_MASTER_TOKEN} sh -s - agent \
  --node-ip=${VPN_IP} \
  --node-external-ip=${VPN_IP}
