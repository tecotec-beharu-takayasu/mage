# Create this using node5 image
FROM node:19.6.0
ARG NODE_ENV


# Ensure ZMQ system dependency is installed
RUN apt-get update && \
    apt-get install -y libzmq3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Clean out existing application files & caches from the image
RUN rm -rf /usr/src/app && \
    mkdir -p /usr/src/app


# Copy the application into image
COPY . /usr/src/app/node_modules/mage
# COPY . /usr/src/app


# Update package.json to use local MAGE tarball
# Install application dependencies
# WORKDIR /usr/src/app
# RUN sed -i 's/"mage": ".*"/"mage": "file:.\/.docker.mage.tgz"/' package.json && \
#     make deps && \
#     make build && \
#     make assets-index


# Setup entrypoint
EXPOSE 8080
# CMD ["./app"]