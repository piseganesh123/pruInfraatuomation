# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "ganesh@test.com"

# Health check

# Port to expose
EXPOSE 3000