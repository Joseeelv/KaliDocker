IMAGE_NAME=kali-box
CONTAINER_NAME=htb-lab

build:
	docker build --network=host -t $(IMAGE_NAME) -f Dockerfile .

run:
	docker run -dit \
		--name $(CONTAINER_NAME) \
		--cap-add=NET_ADMIN \
		--device /dev/net/tun \
		--network host \
		--privileged \
		$(IMAGE_NAME) zsh
	docker exec -it $(CONTAINER_NAME) zsh

restart:
	docker restart $(CONTAINER_NAME)

down:
	docker stop $(CONTAINER_NAME)
	docker rm -f $(CONTAINER_NAME)

logs:
	docker logs -f $(CONTAINER_NAME)
