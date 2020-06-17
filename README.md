# tyk-build-env

Docker environment used to build official images. This image is used
in Buddy pipelines, Github actions and the plugin compiler is based on
this image.

# Building the image by hand

This section is for only for informational purposes.

In the root of the repo:

``` shell
docker build --build-arg TYK_GW_TAG=v2.8.4 -t tyk-build-env:v2.8.4
```

`TYK_GW_TAG` refers to the _tag_ in github corresponding to a released
version.
