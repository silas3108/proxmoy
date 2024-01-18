#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/madhur/Proxmox/cassandra/misc/build.func)
# Copyright (c) 2021-2024 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE

function header_info {
clear
cat <<"EOF"
   ______                                __          
  / ____/___ _______________ _____  ____/ /________ _
 / /   / __ `/ ___/ ___/ __ `/ __ \/ __  / ___/ __ `/
/ /___/ /_/ (__  |__  ) /_/ / / / / /_/ / /  / /_/ / 
\____/\__,_/____/____/\__,_/_/ /_/\__,_/_/   \__,_/  
EOF
}
header_info
echo -e "Loading..."
APP="Cassandra"
var_disk="4"
var_cpu="1"
var_ram="2048"
var_os="debian"
var_version="12"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=$NEXTID
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
}

function update_script() {
header_info
if [[ ! -f /etc/systemd/system/cassandra.service ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
msg_error "There is currently no update path available."
exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${APP} should be reachable by going to the following URL.
         ${BL}http://${IP}:9042 ${CL} \n"
