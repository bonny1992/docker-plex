IMAGE := bonny1992/plex-rclone
RELEASE := $(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version');

echo:
	@echo RELEASE is $(RELEASE)

test:
	true

image:
	docker build -t $(IMAGE):$(RELEASE) .

push-image:
	docker push $(IMAGE)


.PHONY: all image push-image test