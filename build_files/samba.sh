#!/usr/bin/env bash
source /ctx/common

PKGS=(
   samba
   samba-usershares
   avahi
   wsdd
)

DNF "${PKGS[@]}"