MAKEFLAGS += --silent

.PHONY: all setup argo clean

all: clean setup argo
	true

setup:
	echo "You are about to create demo cluster."
	echo "Are you sure? (Press Enter to continue or Ctrl+C to abort) "
	read _
	./infra/$@.sh

argo:
	./infra/$@.sh

clean:
	echo "You are about to delete demo cluster."
	echo "Are you sure? (Press Enter to continue or Ctrl+C to abort) "
	read _
	bash ./infra/$@.sh

-include include.mk
