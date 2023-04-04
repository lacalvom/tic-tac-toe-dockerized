USER=<docker-hub-username>
IMAGE=tic-tac-toe:latest
# DISPLAY=:1

.PHONY: build push

default: build

build:
	docker build -t $(USER)/$(IMAGE) .

debug:
	xhost + # Enable remote connections to local X11 server.
	docker run --rm -it --name tictactoe --network host -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix $(USER)/$(IMAGE)
	xhost - # Disable  remote connections to local X11 server.
	# to debug inside of container.	
	# docker run --rm -it --name tictactoe $(USER)/$(IMAGE) bash

push:
	docker login
	docker push $(USER)/$(IMAGE)
