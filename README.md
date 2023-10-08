# SS14-Docker-Linux-Server

Containerised server deployment for 

https://spacestation14.io/

Based on the documentation 

https://docs.spacestation14.com/en/general-development/setup/server-hosting-tutorial.html


Made for those who prefer to containerise things.

## Build
  `git clone https://github.com/LiamAEdwards/SS14-Docker-Linux-Server.git && cd SS14-Docker-Linux-Server`
  
  `docker build -t ss14-linux-server . --no-cache`


## Run
Edit the `appsettings.yml` & `server_config.toml` to add your configuration

```
docker run -d \
  -p 1212:1212/tcp \
  -p 1212:1212/udp \
  -p 5000:5000/tcp \
  -p 5000:5000/udp \
  -v /path/on/host:/ss14 \
  ss14-server
```

