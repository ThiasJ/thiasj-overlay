# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils user

DESCRIPTION="Franz is a free messaging app / former Emperor of Austria and combines chat & messaging services into one application. He currently supports Slack, WhatsApp, WeChat, HipChat, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more."
HOMEPAGE="http://meetfranz.com"
SRC_URI_BASE="https://github.com/imprecision/franz-app/releases/download/${PV}"
SRC_URI="	x86? ( ${SRC_URI_BASE}/${PN}-linux-ia32-${PV}.tgz )
		amd64? ( ${SRC_URI_BASE}/${PN}-linux-x64-${PV}.tgz )"

LICENSE="Propietary"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}"

S=${WORKDIR}

RESTRICT="strip binchecks"

src_install() {

	if use doc ; then
		dodoc LICENSE
		dohtml LICENSES.chromium.html
	fi

	dodir /opt/franz
	insinto /opt/franz
	doins -r resources
	doins -r locales
	doins content_shell.pak
	doins icudtl.dat
	doins libffmpeg.so
	doins libnode.so
	doins natives_blob.bin
	doins snapshot_blob.bin
	doins Franz
	fperms 775 /opt/franz/Franz
	dosym /opt/franz/Franz /usr/bin/Franz

	doicon resources/app.asar.unpacked/assets/franz.png resources/app.asar.unpacked/assets/franz.svg
	doins resources/app.asar.unpacked/assets/franz.png resources/app.asar.unpacked/assets/franz.svg

	make_desktop_entry ${PN} "franz" "franz" "Network;InstantMessaging;Chat"

}
