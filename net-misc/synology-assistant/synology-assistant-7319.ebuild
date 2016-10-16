# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib unpacker eutils

DESCRIPTION="Synology Assistant is a desktop utility that searches for Synology DiskStations in the local area network. It helps you set up and install DSM on your 
DiskStation connect to network or multi-functional printers shared by your DiskStation, setup Wake on LAN (WOL), or view monitored resources of your DiskStation."
HOMEPAGE="https://www.synology.com/de-de/dsm/cloud_services"
SRC_URI_BASE="https://global.download.synology.com/download/Tools/Assistant/6.0-${PV}/Ubuntu"
SRC_URI="x86? ( ${SRC_URI_BASE}/i686/${PN}_6.0-${PV}_i386.deb )
		amd64? ( ${SRC_URI_BASE}/x86_64/${PN}_6.0-${PV}_amd64.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
RESTRICT="strip"

S="${WORKDIR}"

src_install() {
	insinto "/"
	doins -r opt/ usr/

	fperms 755 /opt/Synology/SynologyAssistant/SynologyAssistant
}
