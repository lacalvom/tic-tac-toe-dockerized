# Java 11 base image
FROM openjdk:11-jdk-slim-bullseye

# Install GTK+ libraries
RUN apt-get update && apt-get install -y \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libgtk-3-dev \
    xvfb

ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/openjdk-11/lib

# working directory
WORKDIR /app

# Copy application .jar file
COPY target/TicTacToe-1.1.0.jar .

# run the app
CMD ["java", "-jar", "TicTacToe-1.1.0.jar"]
