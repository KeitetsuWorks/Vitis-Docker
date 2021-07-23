##
## @file        Dockerfile
## @brief       Dockerfile for Vitis
## @author      Keitetsu
## @date        2020/04/14
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM keitetsu/vitis:ubuntu18.04-v2021.1-1

##
## install XRT
##
RUN cd /tmp && \
    wget \
        -O xrt_202110.2.11.634_18.04-amd64-xrt.deb \
        https://www.xilinx.com/bin/public/openDownload?filename=xrt_202110.2.11.634_18.04-amd64-xrt.deb && \
    apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq \
        ./xrt_202110.2.11.634_18.04-amd64-xrt.deb && \
    apt-get clean && \
    apt-get autoclean && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*
