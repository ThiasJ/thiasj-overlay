# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib unpacker eutils

DESCRIPTION="To sync files among your Synology NAS and computers"
HOMEPAGE="https://www.synology.com/de-de/dsm/cloud_services"
SRC_URI_BASE="https://global.download.synology.com/download/Tools/CloudStationBackup/4.0-${PV}/Ubuntu/Installer"
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
<<<<<<< HEAD
	doins -r opt/ usr/
=======
	doins -r doins -r /opt /usr
>>>>>>> 4ec4423cb68426a24f7294eb8f00e31494423138

	fperms 755 /opt/Synology/CloudStationBackup/bin/launcher
	fperms 755 /usr/bin/synology-cloud-station-backup
}
