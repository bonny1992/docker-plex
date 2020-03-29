IMAGE := bonny1992/plex-rclone
RELEASE := $(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version');

echo:
	RELEASE := $(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version');
	@echo RELEASE is $(RELEASE)

test:
	true

image:
	RELEASE := $(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version');
	docker build -t $(IMAGE):$(RELEASE) .

push-image:
	docker push $(IMAGE)


.PHONY: all image push-image test