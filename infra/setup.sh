#!/usr/bin/env bash

set -e
set -o pipefail

minikube delete || true
minikube start \
    --kubernetes-version=v1.19.0 \
    --memory=4096 --bootstrapper=kubeadm \
    --extra-config=kubelet.authentication-token-webhook=true \
    --extra-config=kubelet.authorization-mode=Webhook \
    --extra-config=scheduler.address=0.0.0.0 \
    --extra-config=controller-manager.address=0.0.0.0

## Addons:
minikube addons disable metrics-server
