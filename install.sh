#!/bin/bash

echo "Setting up Oracle Instant Client."
echo "This script will set up the Oracle Instant Client for your system."
echo "This script will only work on Mac (Apple Silicon untested)."
echo "Maintained by Raeveen P."
echo " "

teardown() {
    rm -rf oracle/
}

# Ask for prompt, if not set
if [ -z "$PROMPT" ]; then
    read -p "Which architecture are you using? (Options: mac): " PROMPT
fi

# Make manifest folder
if [ ! -d "oracle" ]; then
    mkdir oracle
else
    teardown
    mkdir oracle
fi

# Run Docker Compose up
docker-compose -p oracle-cx up -d

# Wait for container to exit
while [ "$(docker inspect -f '{{.State.Running}}' cx_oracle_dock)" = "true" ]; do
    sleep 30
done

# Run Docker Compose down
docker-compose -p oracle-cx down

# Lowercase and trim the input
PROMPT=$(
    echo "$PROMPT" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]'
)

if [ "$PROMPT" = "mac" ]; then
    # Make directory in /Users/{user}/oracle
    sudo mkdir -p /Users/$(whoami)/oracle

    # Empty out contents in the directory
    sudo rm -rf /Users/$(whoami)/oracle/*

    # Copy files from container to /Users/{user}/oracle
    current_dir=$(pwd)

    cd oracle/mac/instantclient_19_8
    sudo cp -r . /Users/$(whoami)/oracle

    cd $current_dir

    # Create symlink
    sudo mkdir -p /Users/$(whoami)/oracle/lib
    sudo ln -s $HOME/oracle/libclntsh.dylib.19.1 /Users/$(whoami)/oracle/lib/libclntsh.dylib

    if [ -z "$FISH_VERSION" ]; then
        echo "Found that you are using Fish, setting the environment."
        set -x ORACLE_HOME /Users/$(whoami)/oracle
        set -x LD_LIBRARY_PATH $ORACLE_HOME
        set -x PATH $ORACLE_HOME $PATH
    else
        echo "Setting environment for Bash."
        export ORACLE_HOME=/Users/$(whoami)/oracle
        export LD_LIBRARY_PATH=$ORACLE_HOME
        export PATH=$ORACLE_HOME:$PATH
    fi

    exit 1
else
    echo "Invalid architecture."
    exit 1
fi