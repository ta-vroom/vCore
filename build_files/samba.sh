#!/usr/bin/env bash
source /ctx/common

PKGS=(
   samba
   samba-usershares
   avahi
   avahi-tools
   wsdd
   nss-mdns
)

DNF "${PKGS[@]}"