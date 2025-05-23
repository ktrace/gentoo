# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Standalone Gentoo gpg trust anchor generation tool for binpkgs"
HOMEPAGE="https://github.com/projg2/getuto"

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/projg2/getuto"
	inherit git-r3
else
	SRC_URI="
		https://github.com/projg2/getuto/archive/refs/tags/${P}.tar.gz
	"
	S=${WORKDIR}/${PN}-${P}

	KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux"
fi

SRC_URI+=" test? ( https://mirror.bytemark.co.uk/gentoo/releases/amd64/binpackages/23.0/x86-64/virtual/libc/libc-1-r1-1.gpkg.tar -> ${PN}-23.0-libc-1-r1-1.gpkg.tar )"

LICENSE="GPL-2"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	app-crypt/gnupg
	dev-libs/openssl
	sec-keys/openpgp-keys-gentoo-release
	sys-apps/gentoo-functions
"

src_unpack() {
	if [[ ${PV} == 9999 ]] ; then
		git-r3_src_unpack
	else
		# Don't mangle test data
		unpack ${P}.tar.gz
	fi

	if use test ; then
		cp "${DISTDIR}"/${PN}-23.0-libc-1-r1-1.gpkg.tar "${S}/libc-1-r1-1.gpkg.tar" || die
	fi
}

src_install() {
	dobin getuto
}
