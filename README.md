# tic-tac-toe-dockerized
Dockerized Tic-Tac-Toe game

***TicTacToe*** is an application I got from the public repository: ***https://github.com/jlombardo/TicTacToeMaven*** and placed it inside a Docker container.

It's about the 3 in a row game, and it's an application with a small graphical interface, that's why an X11 server is necessary to run it.

An X11 server allows the application inside the container to display its graphical interface on the desktop of your local machine.

On Linux systems, the X11 server is usually installed by default, it would only be necessary to configure it to accept remote connections. This could be done with the following commands.

To enable remote connections to the X11 server:
```bash
xhost +
```

To disable them:
```bash
xhost -
```
On Windows and macOS systems, you could install an X11 server such as [**Xming**](https://sourceforge.net/projects/xming/) or [**XQuartz**](https://www.xquartz.org/) , respectively.

To build the docker image, assuming we are located in the same directory where the ***Dockerfile*** is:
```bash
docker build -t <image_name>:<tag> .
```

To run a container and test it:
```bash
docker run --rm -it --name <container-name> --network host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <image_name>:<tag>
```

In this command, the graphical output of the container is redirected to the local machine and the X11 socket of the local server is connected to the container passing it as a volume.

To facilitate things that exist in ***Makefile*** with all these tasks defined with which you can create a container image, test it and publish it to ***Docker Hub*** if necessary.

For details about container creation check out the ***Dockerfile***.
