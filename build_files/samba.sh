#!/usr/bin/env bash
source /ctx/common

PKGS=(
   samba
   samba-usershares
   avahi
   wsdd
   nss-mdns
)

DNF "${PKGS[@]}"