#!/usr/bin/env bash
source /ctx/common

PKGS=(
   greenboot
   greenboot-default-health-checks
)

DNF "${PKGS[@]}"

systemctl enable \
  greenboot-healthcheck.service \
  greenboot-status.service \
  greenboot-loading-message.service \
  greenboot-grub2-set-counter.service \
  greenboot-grub2-set-success.service \
  greenboot-rpm-ostree-grub2-check-fallback.service
