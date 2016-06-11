# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit java-pkg-2

DESCRIPTION="Download files from the german public broadcasting services"
HOMEPAGE="http://zdfmediathk.sourceforge.net/"
SRC_URI="mirror://sourceforge/zdfmediathk/Mediathek/Mediathek%2011/MediathekView_${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CDEPEND="
	dev-java/commons-compress:0
	dev-java/commons-lang:3.3
	dev-java/jackson:2
	dev-java/jchart2d:0
	dev-java/jgoodies-common:1.8
	dev-java/jgoodies-forms:1.8
	dev-java/jide-oss:0
	dev-java/swingx:1.6
	dev-java/swingx-beaninfo:0
	dev-java/xz-java:0
	"

DEPEND="
	${CDEPEND}
	media-video/vlc
	media-video/flvstreamer
	>=virtual/jdk-1.7
	"
RDEPEND="
	${CDEPEND}
	>=virtual/jdk-1.7
	"

S=${WORKDIR}

java_prepare() {
	rm -v lib/{commons,jackson,jchart2d,jgoodies,jide-oss,swingx,xz}*.jar || die
}

src_compile() {
	:
}

src_install() {
	java-pkg_dojar MediathekView.jar
	java-pkg_dojar lib/MSearch.jar

	insinto /usr/share/${PN}/bin
	doins bin/flv.sh || die

	insinto /usr/share/${PN}
	doins -r Icons

	java-pkg_register-dependency commons-compress commons-compress.jar
	java-pkg_register-dependency commons-lang-3.3 commons-lang.jar
	java-pkg_register-dependency jackson-2 jackson.jar
	java-pkg_register-dependency jchart2d jchart2d.jar
	java-pkg_register-dependency jgoodies-common-1.8 jgoodies-common.jar
	java-pkg_register-dependency jgoodies-forms-1.8 jgoodies-forms.jar
	java-pkg_register-dependency jide-oss jide-oss.jar
	java-pkg_register-dependency swingx-1.6 swingx.jar
	java-pkg_register-dependency swingx-beaninfo swingx-beaninfo.jar
        java-pkg_register-dependency xz-java xz.jar

	java-pkg_dolauncher ${PN} \
		--pwd /usr/share/${PN} \
		 --main mediathek.Main

       	newicon Info/MediathekView.png MediathekView-icon.png || die

        make_desktop_entry ${PN} MediathekView MediathekView-icon "AudioVideo;TV;Video"
}
