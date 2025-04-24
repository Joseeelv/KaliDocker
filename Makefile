run:
	docker run -it --privileged kali-box
restart:
	docker restart kali-box
down:
	docker stop kali-box
terminal:
	docker exec -it kali-box zsh
build:
	docker build -t kali-box -f Dockerfile .

