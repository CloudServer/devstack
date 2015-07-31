#!/bin/bash

# Keep track of the devstack directory
TOP_DIR=$(cd $(dirname "$0")/.. && pwd)

source $TOP_DIR/functions

VIRT_DRIVER=libvirt
LIBVIRT_TYPE=parallels
ALL_IMAGES=$(source $TOP_DIR/stackrc && echo $IMAGE_URLS)

# Make a nice list
echo $ALL_IMAGES | tr ',' '\n' | sort | uniq

# Sanity check - ensure we have a minimum number of images
num=$(echo $ALL_IMAGES | tr ',' '\n' | sort | uniq | wc -l)
if [[ "$num" -lt 2 ]]; then
    echo "ERROR: We only found $num images in $ALL_IMAGES, which can't be right."
    exit 1
fi
