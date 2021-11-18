#!/bin/bash -eu

##
## @file        init_vitis.sh
## @brief       Script to initialize Vitis
## @author      Keitetsu
## @date        2020/04/13
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

if [ -f /opt/Xilinx/Vitis/2021.2/settings64.sh ]; then
    . /opt/Xilinx/Vitis/2021.2/settings64.sh
fi
