# Copyright 2009-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg

DESCRIPTION="Free EDA software to develop printed circuit boards"
HOMEPAGE="https://librepcb.org/"
SRC_URI="https://download.librepcb.org/releases/${PV}/${P}-source.zip"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
	app-arch/unzip
	dev-qt/linguist-tools:5"

RDEPEND="
	dev-libs/quazip:=
	dev-qt/qtcore:5
	dev-qt/qtconcurrent:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtopengl:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsql:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	sys-libs/zlib"

DEPEND="${RDEPEND}"

src_configure() {
	local pro_lst
	for pro_lst in $(find libs/librepcb/ -type f -name "*.pro" || die)
	do
		sed -e 's:target.path = $${PREFIX}/lib:target.path = $${PREFIX}/'$(get_libdir)':' -i ${pro_lst} || die "Can't replace target.path"
	done
	eqmake5 -r PREFIX="/usr" UNBUNDLE+="quazip"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
