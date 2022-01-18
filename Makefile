# Self-hosting with minikube

MAKEFLAGS += --silent

.PHONY: all clean setup install-argocd

all: clean setup install-argocd

setup:
	echo "You are about to create demo cluster."
	echo "Are you sure? (Press Enter to continue or Ctrl+C to abort) "
	read _
	.github/self-hosted/$@.sh

install-argocd:
	.github/self-hosted/$@.sh
	echo ""
	echo "::URL       'http://localhost:8080'"
	echo "::LOGIN     'admin'"
	echo "::PASSWORD  $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)"

clean:
	.github/self-hosted/$@.sh

-include include.mk
