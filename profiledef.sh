#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="idkwtntd-test"
iso_label="ARCH_$(date +%Y%m)"
iso_publisher="KiiwiiWasTaken <http://kiiwiis.xyz/~kiiwiiwastaken>"
iso_application="I don't know what to name this distro"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
