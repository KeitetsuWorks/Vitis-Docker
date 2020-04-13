#!/bin/bash

##
## @file        run_base.sh
## @brief       Script to run the Vitis Docker Image
## @author      Keitetsu
## @date        2020/04/13
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

xhost +local:root

docker run \
    --interactive \
    --tty \
    --net host \
    --rm \
    --name vitis \
    --env TZ=Asia/Tokyo \
    --env DISPLAY=${DISPLAY} \
    --env QT_X11_NO_MITSHM=1 \
    --env HOST_USER=root \
    --env HOST_UID=0 \
    --env HOST_GROUP=root \
    --env HOST_GID=0 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --volume /data1/Software/Xilinx:/data \
    keitetsu/vitis:ubuntu18.04-base \

