#!/bin/bash

#
# Config
#

ECLIPSE_ARCHIVE=eclipse-emoflon-linux-user-ci
EMOFLON_RELEASE=v1.0.0.202210111747-r4
EMOFLON_SRC_URL="https://github.com/eMoflon/emoflon-ibex-eclipse-build/releases/download/$EMOFLON_RELEASE/$ECLIPSE_ARCHIVE.zip"

set -e
START_PWD=$PWD

#
# Utils
#

# Displays the given input including "=> " on the console.
log () {
	echo "=> $1"
}

#
# Script
#

log "Start provisioning."

# GIPS Eclipse (CI)
log "Installing eMoflon::IBeX Eclipse (CI)."
mkdir -p ~/eclipse-apps-ci
cd ~/eclipse-apps-ci

# Get Eclipse (CI)
if [[ ! -f "./$ECLIPSE_ARCHIVE.zip" ]]; then
	log "Downloading specified eMoflon::IBeX Eclipse archive from Github."
        wget -q $EMOFLON_SRC_URL
fi

if [[ ! -f "./$ECLIPSE_ARCHIVE.zip" ]]; then
        log "Download of eMoflon::IBeX Eclipse (CI) archive failed."
        exit 1;
fi

unzip -qq -o $ECLIPSE_ARCHIVE.zip
rm -f $ECLIPSE_ARCHIVE.zip

# Install eMoflon::IBeX from custom updatesite to included Eclipse (VM)
# TODO

# Get example projects from PSF
# TODO
mkdir -p /home/vagrant/git && cd /home/vagrant/git

# TODO
#git clone https://github.com/Echtzeitsysteme/gips-seams-2023-exemplar.git

# Import example projects into default workspace
#cd /home/vagrant/eclipse-apps-ci/eclipse
#./eclipse -noSplash -consoleLog -data /home/vagrant/eclipse-workspace -application com.seeq.eclipse.importprojects.headlessimport -importProject /home/vagrant/git/gips-seams-2023-exemplar/

# Eclipse CI clean up
#cd /home/vagrant
#rm -rf /home/vagrant/eclipse-apps-ci

log "Finished provisioning."
