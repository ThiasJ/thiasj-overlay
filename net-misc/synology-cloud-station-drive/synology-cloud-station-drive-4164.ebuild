# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib unpacker eutils

DESCRIPTION="To sync files among your Synology NAS and computers. Uses DSM 6.0beta and CloudStation 4.0."
HOMEPAGE="https://www.synology.com/de-de/dsm/cloud_services"
SRC_URI_BASE="https://global.download.synology.com/download/Tools/CloudStation/4.0-${PV}/Ubuntu/Installer"
SRC_URI="x86? ( ${SRC_URI_BASE}/i686/${P}.i686.deb )
		amd64? ( ${SRC_URI_BASE}/x86_64/${P}.x86_64.deb )"

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

	fperms 755 /opt/Synology/CloudStation/bin/launcher
	fperms 755 /usr/bin/synology-cloud-station-drive
}
