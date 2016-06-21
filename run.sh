#!/bin/sh

# provision elasticsearch user
addgroup sudo
adduser -D -g '' elasticsearch
adduser elasticsearch sudo
chown -R elasticsearch /elasticsearch /data
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# set environment
export CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch-default}
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_ENABLE=${HTTP_ENABLE:-true}
export HTTP_CORS_ENABLE=${HTTP_CORS_ENABLE:-true}
export HTTP_CORS_ALLOW_ORIGIN=${HTTP_CORS_ALLOW_ORIGIN:-*}
export NETWORK_HOST=${NETWORK_HOST:-_site_}

# AWS stuff
export AWS_KEY=${AWS_KEY:-myawskey}
export AWS_SECRET=${AWS_SECRET:-myawssecret}
export TAG_KEY=${TAG_KEY:-somekey}
export TAG_VALUE=${TAG_VALUE:-somevalue}

# allow for memlock
ulimit -l unlimited

# run
sudo -E -u elasticsearch /elasticsearch/bin/elasticsearch
