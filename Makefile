
# Include optional config
# Sample usage: echo "DOCKER_OPTIONS=-v `pwd`/mozilla:/home/user/.mozilla" >> .env

-include .env

PWD := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

run: build data
	docker run -it --rm -p5900:5900 $(DOCKER_OPTIONS) -v $(PWD)/data:/home/user/data kastaneda/p24_sandbox

build: cryptoplugin-1.2.2-all.deb
	docker build -t kastaneda/p24_sandbox ./

cryptoplugin-1.2.2-all.deb:
	wget https://cb.privatbank.ua/p24-cryptoplugin/1.2.2/cryptoplugin-1.2.2-all.deb

data:
	mkdir -p data

.PHONY: run build
