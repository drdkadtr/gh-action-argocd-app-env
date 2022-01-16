#!/bin/bash

app_file="$1"
app_name="$2"
gh_repo="$3"
app_path="$4"
app_ns="$5"

tee "${app_file}"<<EOF
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
 name: "${app_name}"
 namespace: argocd
spec:
 project: default
 source:
  repoURL: "${gh_repo}"
  targetRevision: HEAD
  path: "${app_path}"
 destination:
  server: https://kubernetes.default.svc
  namespace: "${app_ns}"
 syncPolicy:
  syncOptions:
   - CreateNamespace=true
  automated:
   selfHeal: true
   prune: true
EOF
