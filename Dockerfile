# Imagen base de Java 11
FROM openjdk:11-jdk-slim-bullseye

# Instalar librerías de GTK+
RUN apt-get update && apt-get install -y \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libgtk-3-dev \
    xvfb

ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/openjdk-11/lib

# Directorio de trabajo
WORKDIR /app

# Copiar archivo .jar de la aplicación
COPY target/TicTacToe-1.1.0.jar .

# Ejecutar la aplicación
CMD ["java", "-jar", "TicTacToe-1.1.0.jar"]
