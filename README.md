# gh-action-argocd-app-env

GitOps repo with ArgoCD and GitHub Actions self-hosted runner (minikube)

#### Commands

```bash
# install ArgoCD in k8s
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# access ArgoCD UI
kubectl get svc -n argocd
killall kubectl || kubectl port-forward svc/argocd-server 8080:443 -n argocd &

# login with admin user and below token (as in documentation):
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
```
</br>

#### Links

* Gitub action: [workflow_dispatch](https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows#workflow_dispatch)
* NodeJs App: [https://hub.docker.com/repository/docker/adtrdr/json-server-app](https://hub.docker.com/repository/docker/adtrdr/json-server-app)
* Install ArgoCD: [https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd](https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd)
* Login to ArgoCD: [https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli](https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli)
* ArgoCD Configuration: [https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/)
