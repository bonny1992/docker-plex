IMAGE := bonny1992/plex-rclone

test:
	true

image:
	docker build -t "$(IMAGE):$(PLEX_RELEASE)" .

push-image:
	docker push $(IMAGE)


.PHONY: image push-image test