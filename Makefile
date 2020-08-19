
# Include optional config
# Sample usage: echo "DOCKER_OPTIONS=-v `pwd`/mozilla:/home/user/.mozilla" >> .env

-include .env

PWD := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

run: build data
	docker run -it --rm -p5900:5900 $(DOCKER_OPTIONS) -v $(PWD)/data:/home/user/data kastaneda/p24_sandbox

build:
	docker build -t kastaneda/p24_sandbox ./

data:
	mkdir -p data

.PHONY: run build
