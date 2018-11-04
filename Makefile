.PHONY: build login push

IMAGE := quay.io/app-sre/diag-container:latest

build:
	@docker build -t $(IMAGE) .

login: check-env-push
ifndef QUAY_USER
	$(error QUAY_USER not defined)
endif
ifndef QUAY_TOKEN
	$(error QUAY_TOKEN not defined)
endif
	@docker login -u $(QUAY_USER) -p $(QUAY_TOKEN) quay.io

push:
	@docker push $(IMAGE)
