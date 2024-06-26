# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Rule management for SNORT"
HOMEPAGE="https://oinkmaster.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/oinkmaster/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ppc sparc x86"
IUSE="X"

RDEPEND="
	app-arch/gzip
	app-arch/tar
	>=dev-lang/perl-5.6.1
	net-misc/wget
	X? ( dev-perl/Tk )
"

src_install() {
	dobin \
		contrib/addmsg.pl \
		contrib/addsid.pl \
		contrib/create-sidmap.pl \
		contrib/makesidex.pl \
		oinkmaster.pl

	use X && dobin contrib/oinkgui.pl

	dodoc FAQ README README.gui README.win32 UPGRADING contrib/README.contrib

	doman oinkmaster.1

	insinto /etc
	doins oinkmaster.conf
}
