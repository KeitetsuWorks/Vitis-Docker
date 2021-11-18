#!/bin/bash -eu

##
## @file        install.sh
## @brief       Script to install Vitis Unified Software Platform
## @author      Keitetsu
## @date        2020/04/13
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

# ./xsetup -b ConfigGen

./xsetup \
    --agree 3rdPartyEULA,XilinxEULA \
    --batch Install \
    --config install_config.txt

