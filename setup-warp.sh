#!/bin/bash

install() {
# [ Menginstall ]
cd /usr/bin
warp -a

}

read -p "Input Option: " opw
case $opw in
1) clear ; install ;;
esac
