MAKEFLAGS += --silent

.PHONY: all setup argo clean

all: clean setup argo
	true

setup:
	echo "You are about to create demo cluster."
	echo "Are you sure? (Press Enter to continue or Ctrl+C to abort) "
	read _
	.github/self-hosted/$@.sh

argo:
	.github/self-hosted/$@.sh

clean:
	.github/self-hosted/$@.sh

-include include.mk
