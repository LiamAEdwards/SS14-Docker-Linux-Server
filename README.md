<h1 align="center">SS14-Docker-Linux-Server 🚀</h1>

<p align="center">
  Containerized deployment of the <a href="https://spacestation14.io/">Space Station 14</a> server on Linux.
</p>


---

⚠️ **DISCLAIMER**: This Docker deployment is currently in its early stages and **has not been thoroughly tested**.

---

### 📖 Overview

This project is for those who prefer containerized solutions, making server deployment and management a breeze. It's based on the [official documentation](https://docs.spacestation14.com/en/general-development/setup/server-hosting-tutorial.html) but wrapped up in a Docker container for convenience.

### 🚀 Quick Start

1. **Clone the repository**

    ```bash
    git clone https://github.com/LiamAEdwards/SS14-Docker-Linux-Server.git && cd SS14-Docker-Linux-Server
    ```

2. **Configure Your Server**

    Edit the `appsettings.yml` & `server_config.toml` to match your desired configuration.

3. **Run the Server**

    ```bash
    docker run -d \
      -p 1212:1212/tcp \
      -p 1212:1212/udp \
      -p 5000:5000/tcp \
      -p 5000:5000/udp \
      -v /path/on/host:/ss14 \
      ghcr.io/liamaedwards/ss14-docker-linux-server:main
    ```

---

