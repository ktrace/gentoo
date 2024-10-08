# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gentoo/gentoo-zsh-completions.git"
else
	SRC_URI="https://github.com/gentoo/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
fi

DESCRIPTION="Gentoo specific zsh completion support (includes emerge and ebuild commands)"
HOMEPAGE="https://github.com/gentoo/gentoo-zsh-completions"

LICENSE="ZSH"
SLOT="0"

RDEPEND=">=app-shells/zsh-4.3.5"

src_install() {
	insinto /usr/share/zsh/site-functions
	doins src/_*

	dodoc AUTHORS
}
