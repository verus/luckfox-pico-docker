.PHONY: all clean submodules launch shell

all: shell

launch:
	docker compose up dev -d

stop:
	docker compose down dev

shell: launch
	docker compose exec dev /bin/bash
	make stop
