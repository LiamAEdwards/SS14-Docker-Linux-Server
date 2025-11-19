<h1 align="center">SS14-Docker-Linux-Server 🚀</h1>

<p align="center">
  Containerized deployment of the <a href="https://spacestation14.io/">Space Station 14</a> server on Linux.
</p>

<div align="center">

[![Create and publish a Docker image](https://github.com/LiamAEdwards/SS14-Docker-Linux-Server/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/LiamAEdwards/SS14-Docker-Linux-Server/actions/workflows/main.yml)

</div>


### Overview

This project is for those who prefer containerized solutions. It's based on the [official documentation](https://docs.spacestation14.com/en/general-development/setup/server-hosting-tutorial.html) but wrapped up in a Docker container for convenience.

### Quick Start

1. **Clone the repository**

    ```bash
    git clone https://github.com/LiamAEdwards/SS14-Docker-Linux-Server.git && cd SS14-Docker-Linux-Server
    ```

2. **Configure Your Server**

    Edit the `appsettings.yml` & `server_config.toml` to match your desired configuration.

3. **Run the Server**

    Using Docker directly:

    ```bash
    docker run -d \
      -p 1212:1212/tcp \
      -p 1212:1212/udp \
      -p 5000:5000/tcp \
      -p 5000:5000/udp \
      -v /path/on/host:/ss14 \
      ghcr.io/liamaedwards/ss14-docker-linux-server:main
    ```

    Or using Docker Compose:

    First, create a `docker-compose.yml` file:

    ```yaml
    version: '3'

    services:
      ss14-server:
        image: ghcr.io/liamaedwards/ss14-docker-linux-server:main
        ports:
          - "1212:1212/tcp"
          - "1212:1212/udp"
          - "5000:5000/tcp"
          - "5000:5000/udp"
        volumes:
          - /path/on/host:/ss14
        restart: always
    ```

    Then, run with:

    ```bash
    docker-compose up -d
    ```

---
