IMAGE := bonny1992/plex-rclone
RELEASE := $(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version');

test:
	true

image:
	docker build -t $(IMAGE):$(RELEASE) --build-arg PLEX_RELEASE=$(RELEASE) .

push-image:
	docker push $(IMAGE)


.PHONY: image push-image test