IMAGE    ?= pkuhar/txwifi
NAME     ?= txwifi
VERSION  ?= 1.0.5

all: build push

dev: dev_build dev_run

build:
	docker build -t $(IMAGE):latest .
	docker build -t $(IMAGE):arm32v7-$(VERSION) .

push:
	docker build -t $(IMAGE):latest .
	docker build -t $(IMAGE):arm32v7-$(VERSION) .

dev_build:
	docker build -t $(IMAGE) ./dev/

dev_run:
	sudo docker run --rm -it --privileged --network=host \
                   -v $(CURDIR):/go/src/github.com/unrelatedlabs/txwifi \
                   -w /go/src/github.com/unrelatedlabs/txwifi \
                   --name=$(NAME) $(IMAGE):latest


