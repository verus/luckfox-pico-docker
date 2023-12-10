.PHONY: all clean submodules shell build

ENV_PREFIX := USER_ID=$$(id -u $$USER) GROUP_ID=$$(id -g $$USER)
DOCKER := docker
DOCKER_COMPOSE_COMMAND := $(DOCKER) compose
DOCKER_COMPOSE := $(ENV_PREFIX) $(DOCKER_COMPOSE_COMMAND)


define is_exists_docker
	if ! command -v $(DOCKER); then
		echo "ERROR: 'docker' command is not found."
		echo "ERROR: Please install docker environments."
		exit 1
	fi
endef
export is_exists_docker

define is_exists_docker_compose
	if ! $(DOCKER_COMPOSE_COMMAND) version 2> /dev/null; then
		echo "ERROR: 'docker compose' subcommand is not found."
		echo "ERROR: Plaase install the 'docker compose' subcommand."
		echo "ERROR: see also: https://docs.docker.com/compose/install/linux/"
		exit 1
	fi
endef
export is_exists_docker_compose

all: shell

containers-start: container-environment-check
	$(DOCKER_COMPOSE) up -d

containers-stop: container-environment-check
	$(DOCKER_COMPOSE) down

shell: submodules containers-start
	$(DOCKER_COMPOSE) exec terminal /bin/bash

build: submodules containers-start
	$(DOCKER_COMPOSE) exec terminal /bin/bash -c ./build.sh

submodules:
	git submodule update --init --recursive

container-environment-check:
	echo "$${is_exists_docker}" | $(SHELL)
	echo "$${is_exists_docker_compose}" | $(SHELL)

clean: containers-stop
