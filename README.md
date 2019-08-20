# tyk-build-env

Docker environment used to build official images and plugins.

The usecase is that you have a plugin (probably Go) that you require
to be built.

## Building the plugin

Navigate to where your plugin is and build using a docker volume to
mount your code into the image.

``` shell
cd ${GOPATH}/src/tyk-plugin
docker run -v `pwd`:/go/src/plugin-build plugin-build pre
```

You will find a `pre.so` in the current directory which is the file
that goes into the API definition

# Building the image

This will build the image that will be used in the plugin build
step. This section is for only for informational purposes.

In the root of the repo:

``` shell
docker build -t tyk-plugin-build .
```

