#!/usr/bin/env bash

function error {
    echo "Error; $1"
}

OPTIONS="${RUNNER_OPTIONS:-""}"

GROUP=${RUNNER_GROUP:-"default"}

echo "Configuring GitHub Actions Runner and registering"
./config.sh \
    --unattended \
    --url "https://github.com/Stefano-Solo/acr-build-helloworld-node" \
    --token "AN63AFYMBMXSNJAQIXPS74LDNUJ2K" \
    --name "myrunner" \
    --runnergroup ${GROUP} \
    $OPTIONS

echo "Starting GitHub Actions Runner"
env -i ./runsvc.sh
