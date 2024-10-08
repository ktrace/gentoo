# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Meta ebuild for the Lohit family of Indic fonts"
HOMEPAGE="https://pagure.io/lohit"
LICENSE="OFL-1.1"

SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~loong ppc ppc64 ~riscv ~s390 sparc x86 ~ppc-macos"
IUSE=""

RDEPEND="
	=media-fonts/lohit-assamese-2*
	=media-fonts/lohit-bengali-2*
	=media-fonts/lohit-devanagari-2*
	=media-fonts/lohit-gujarati-2*
	=media-fonts/lohit-gurmukhi-2*
	=media-fonts/lohit-kannada-2*
	=media-fonts/lohit-malayalam-2*
	=media-fonts/lohit-marathi-2*
	=media-fonts/lohit-nepali-2*
	=media-fonts/lohit-odia-2*
	=media-fonts/lohit-tamil-2*
	=media-fonts/lohit-tamil-classical-2*
	=media-fonts/lohit-telugu-2*
	"
