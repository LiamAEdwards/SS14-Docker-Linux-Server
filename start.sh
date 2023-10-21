#!/bin/bash

# Check if directory is empty
if [ ! "$(ls -A /ss14)" ]; then
    # Copy the default files
    cp -R /ss14-default/* /ss14/
fi

# Start the original command
cd ss14/publish/
./SS14.Watchdog "$@"

