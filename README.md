# tyk-build-env

Docker environment used to build official images and plugins which are used in:
- Buddy pipelines
- Github actions (ga branch)
- Plugin compiler

The dependencies in this Dockerfile is the union of gateway, dashboard and pump build-time dependencies.
