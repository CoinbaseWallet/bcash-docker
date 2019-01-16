VERSION?=v1.1.0

DOCKER_REPO?=petejkim/bcash
DOCKER_FULLTAG=$(DOCKER_REPO):$(VERSION)

BCASH_CHECKOUT?=tags/$(VERSION)

build:
	@echo "building: $(DOCKER_FULLTAG)"
	@docker build -t $(DOCKER_FULLTAG) \
		--build-arg BCASH_VERSION=$(BCASH_CHECKOUT) \
		.

# Current option for latest:
latest: build
	@echo "Tagging latest"
	@docker tag $(DOCKER_FULLTAG) $(DOCKER_REPO):latest

master: DOCKER_TAG=master
master: BCASH_CHECKOUT=master
master: build

.PHONY: build latest
