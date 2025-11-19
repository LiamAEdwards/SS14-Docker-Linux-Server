# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Update and install necessary tools
RUN apt-get -y update && \
    apt-get -y install curl unzip wget git

# Download and extract SS14 server
ADD https://wizards.cdn.spacestation14.com/fork/wizards/version/c50d610771a5674469aef9c4628b10f08a8c74ae/file/SS14.Server_linux-x64.zip SS14.Server_linux-x64.zip
RUN unzip SS14.Server_linux-x64.zip -d /ss14-default/

# Download and build Watchdog
RUN wget https://github.com/space-wizards/SS14.Watchdog/archive/refs/heads/master.zip -O Watchdog.zip && \
    unzip Watchdog.zip -d Watchdog && \
    cd Watchdog/SS14* && \
    dotnet publish -c Release -r linux-x64 --no-self-contained && \
    cp -r SS14.Watchdog/bin/Release/net9.0/linux-x64/publish /ss14-default

# Server stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS server

# Copy from the build stage
COPY --from=build /ss14-default /ss14-default

# Install necessary tools
RUN apt-get -y update && apt-get -y install unzip

# Expose necessary ports
EXPOSE 1212/tcp
EXPOSE 1212/udp
EXPOSE 5000/tcp
EXPOSE 5000/udp

# Set volume
VOLUME [ "/ss14" ]

# Add configurations
ADD appsettings.yml /ss14-default/publish/appsettings.yml
ADD server_config.toml /ss14-default/publish/server_config.toml

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set the entry point for the container
ENTRYPOINT ["/start.sh"]
