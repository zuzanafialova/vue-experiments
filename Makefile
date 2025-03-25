.PHONY: init pull build build-clen start stop test check fmt print-repos logs

MAKEFLAGS += --silent

.DEFAULT_GOAL = start

list-commands:
	echo 'Available commands:' && grep '^[^#[:space:]].*:' Makefile | grep --invert-match \.PHONY | sed 's/:$$//'

start:
	docker compose up -d
	docker compose logs --follow


