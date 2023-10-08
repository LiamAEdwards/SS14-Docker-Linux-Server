#!/bin/sh

# Check if directory is empty
if [ ! "$(ls -A /ss14)" ]; then
    # Copy the default files
    cp -R /ss14-default/* /ss14/
fi

# Start the original command
exec /ss14/Robust.Server "$@"

