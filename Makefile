IMAGE := bonny1992/plex-rclone
$(eval RELEASE = $(shell curl -sX GET 'https://plex.tv/api/downloads/5.json' | jq -r '.computer.Linux.version'))

echo:
	@echo RELEASE is $(RELEASE)

test:
	true

image:
	docker build -t $(IMAGE):latest -t $(IMAGE):$(RELEASE) .

push-image:
	docker push $(IMAGE):$(RELEASE)
	docker push $(IMAGE):latest


.PHONY: all image push-image test