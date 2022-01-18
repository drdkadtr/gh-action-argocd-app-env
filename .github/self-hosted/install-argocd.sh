#!/usr/bin/env bash

set -e
set -o pipefail

NS=argocd

kubectl create namespace "$NS"
kubectl apply -n "$NS" -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=available deployment -l "app.kubernetes.io/name=argocd-server" -n "$NS" --timeout=600s
kubectl wait --for=condition=available deployment argocd-repo-server -n "$NS" --timeout=60s
kubectl wait --for=condition=available deployment argocd-dex-server -n "$NS" --timeout=60s

kubectl -n "$NS" patch deployment argocd-server --type json \
  -p='[ { "op": "replace", "path":"/spec/template/spec/containers/0/command","value": ["argocd-server","--staticassets","/shared/app","--insecure"] }]'
