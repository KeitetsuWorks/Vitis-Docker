#!/bin/bash

##
## @file        run.sh
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
    --env HOST_USER=${USER} \
    --env HOST_UID=$(id -u ${USER}) \
    --env HOST_GROUP=${USER} \
    --env HOST_GID=$(id -g ${USER}) \
    --env XILINXD_LICENSE_FILE=/data/Xilinx.lic \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --volume /data1/Software/Xilinx:/data \
    keitetsu/vitis:ubuntu18.04-v2019.2-1 \

