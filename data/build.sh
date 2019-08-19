#!/bin/bash

# This directory will contain the plugin source and will be
# mounted by the user using docker volumes
PLUGIN_BUILD_PATH=/go/src/plugin-build

set -e

mode=$1

function usage() {
    cat <<EOF
To build the app:
      $0 <main> <version>
To build a plugin:
      $0 <plugin> <plugin_name>

EOF
}

if [ -z "$mode" -o -z "$2" ]; then
    usage
    exit 1
fi


case $mode in
    main)
        version=$2
        cd $GOPATH
        go get -d -v github.com/TykTechnologies/tyk
        cd ${GOPATH}/src/github.com/TykTechnologies/tyk && \
            git checkout $version && \
            go install -tags 'coprocess python goplugin'
        cp -r ${GOPATH}/bin $PLUGIN_BUILD_PATH/build
        ;;
    plugin)
        plugin_name=$2
        cd $PLUGIN_BUILD_PATH && \
            go build -buildmode=plugin -o $plugin_name
        ;;
esac
