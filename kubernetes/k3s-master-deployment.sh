#!/bin/bash

KUBERNETES_VERSION=v1.22.17
CONTROL_PLANE_FQDN=karmada-cplane.example.com
PUBLIC_IP=1.2.3.4
VPN_IP=100.64.0.5
KUBERNETES_CLUSTER_CIDR=10.100.0.0/16

export INSTALL_K3S_VERSION=${KUBERNETES_VERSION}+k3s1
curl -sfL https://get.k3s.io | sh -s - server \
  --node-taint CriticalAddonsOnly=true:NoExecute \
  --tls-san ${CONTROL_PLANE_FQDN} \
  --tls-san ${PUBLIC_IP} \
  --tls-san ${VPN_IP} \
  --disable=traefik \
  --flannel-backend=none \
  --disable-network-policy \
  --disable=servicelb \
  --write-kubeconfig-mode 664 \
  --cluster-cidr=${KUBERNETES_CLUSTER_CIDR} \
  --advertise-address=${VPN_IP} \
  --bind-address=${VPN_IP} \
  --node-ip=${VPN_IP} \
  --node-external-ip=${VPN_IP}
