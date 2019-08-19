# tyk-build-env

Docker environment used to build official images and plugins.

The usecase is that you have a plugin (probably Go) that you require
to be built.

## Building the plugin

Navigate to where your plugin is and build using a docker volume to
mount your code into the image.

``` shell
cd ${GOPATH}/src/tyk-plugin
docker run -v `pwd`:/go/src/plugin-build plugin-build plugin pre
```

You will find a `pre.so` in the current directory which is the file
that goes into the API definition

## Building the main app

``` shell
cd ${GOPATH}/src/tyk-plugin
docker run -v `pwd`:/go/src/plugin-build plugin-build
```

You will find a `build` directory in the current direcotry with the
build artifacts.

# Building the image

This will build the image that will be used in the plgin build
step. This section is for only for informational purposes.

In the root of the repo:

``` shell
docker build -t tyk-plugin-build .
```

