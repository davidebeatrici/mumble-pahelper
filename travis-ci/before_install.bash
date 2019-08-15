#!/bin/bash -ex
#
# Copyright 2005-2018 The Mumble Developers. All rights reserved.
# Use of this source code is governed by a BSD-style license
# that can be found in the LICENSE file at the root of the
# Mumble source tree or at <https://www.mumble.info/LICENSE>.

MUMBLE_HOST_DEB=${MUMBLE_HOST/_/-}

if [ "${MUMBLE_QT}" == "qt4" ] && [ "${MUMBLE_HOST}" == "x86_64-linux-gnu" ]; then
	sudo apt-get -qq update
elif [ "${MUMBLE_QT}" == "qt5" ] && [ "${MUMBLE_HOST}" == "x86_64-linux-gnu" ]; then
	sudo apt-get -qq update
	sudo apt-get install qt5-default
elif [ "${MUMBLE_QT}" == "qt5" ] && [ "${MUMBLE_HOST}" == "i686-w64-mingw32" ]; then
	sudo dpkg --add-architecture i386
	sudo apt-get -qq update
	echo "deb https://dl.mumble.info/mirror/pkg.mxe.cc/repos/apt xenial main" | sudo tee /etc/apt/sources.list.d/mxe.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86B72ED9
	sudo apt-get -qq update
	sudo apt-get install mxe-${MUMBLE_HOST_DEB}.static-qtbase
elif [ "${MUMBLE_QT}" == "qt5" ] && [ "${MUMBLE_HOST}" == "x86_64-w64-mingw32" ]; then
	sudo dpkg --add-architecture i386
	sudo apt-get -qq update
	echo "deb https://dl.mumble.info/mirror/pkg.mxe.cc/repos/apt xenial main" | sudo tee /etc/apt/sources.list.d/mxe.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86B72ED9
	sudo apt-get -qq update
	sudo apt-get install mxe-${MUMBLE_HOST_DEB}.static-qtbase
else
	exit 1
fi
