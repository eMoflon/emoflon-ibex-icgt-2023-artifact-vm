#!/bin/bash

#
# Config
#

EMOFLON_BASE_VM_RELEASE=v1.0.0.202210111747-r4

set -e
START_PWD=$PWD

if [[ ! -f "./emoflon-vm.zip" ]]; then
	log "Downloading eMoflon::IBeX Eclipse archive: $EMOFLON_BASE_VM_RELEASE"
	wget -q https://github.com/eMoflon/emoflon-ibex-vm/releases/download/$EMOFLON_BASE_VM_RELEASE/emoflon-vm.zip
    wget -q https://github.com/eMoflon/emoflon-ibex-vm/releases/download/$EMOFLON_BASE_VM_RELEASE/emoflon-vm.z01
    wget -q https://github.com/eMoflon/emoflon-ibex-vm/releases/download/$EMOFLON_BASE_VM_RELEASE/emoflon-vm.z02
fi
