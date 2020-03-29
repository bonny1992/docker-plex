IMAGE := bonny1992/plex-rclone:$(curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version')

echo:
	@echo RELEASE is $(IMAGE)

test:
	true

image:
	docker build -t $(IMAGE) .

push-image:
	docker push $(IMAGE)


.PHONY: all image push-image test