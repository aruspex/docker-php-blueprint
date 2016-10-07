#!/bin/bash

dc () {
	docker-compose $@
}

up () {
	if [ $(dc ps | wc -l) -gt 2 ]; then
		echo "Running..."
		dc start
	else
		echo "Creating and running..."
		dc up -d
	fi
}

down () {
	dc down -v
}

composer () {
	dc -f docker-composer.yml run --rm composer $@
}

$@