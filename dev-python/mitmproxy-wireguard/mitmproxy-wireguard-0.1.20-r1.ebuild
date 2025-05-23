# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..13} )

CRATES="
	adler@1.0.2
	aead@0.5.1
	aho-corasick@0.7.20
	anyhow@1.0.68
	arc-swap@1.6.0
	async-stream-impl@0.3.3
	async-stream@0.3.3
	async-trait@0.1.61
	atty@0.2.14
	autocfg@1.1.0
	axum-core@0.3.1
	axum@0.6.2
	base64@0.13.1
	bitflags@1.3.2
	blake2@0.10.6
	block-buffer@0.10.3
	boringtun@0.5.2
	bumpalo@3.11.1
	byteorder@1.4.3
	bytes@1.3.0
	cc@1.0.78
	cfg-if@1.0.0
	chacha20@0.9.0
	chacha20poly1305@0.10.1
	cipher@0.4.3
	console-api@0.4.0
	console-subscriber@0.1.8
	cpufeatures@0.2.5
	crc32fast@1.3.2
	crossbeam-channel@0.5.6
	crossbeam-utils@0.8.14
	crypto-common@0.1.6
	curve25519-dalek@3.2.0
	digest@0.10.6
	digest@0.9.0
	either@1.8.0
	env_logger@0.9.3
	flate2@1.0.25
	fnv@1.0.7
	futures-channel@0.3.25
	futures-core@0.3.25
	futures-executor@0.3.25
	futures-io@0.3.25
	futures-macro@0.3.25
	futures-sink@0.3.25
	futures-task@0.3.25
	futures-util@0.3.25
	futures@0.3.25
	generic-array@0.14.6
	getrandom@0.1.16
	getrandom@0.2.8
	h2@0.3.15
	hashbrown@0.12.3
	hdrhistogram@7.5.2
	hermit-abi@0.1.19
	hermit-abi@0.2.6
	hex@0.4.3
	hmac@0.12.1
	http-body@0.4.5
	http-range-header@0.3.0
	http@0.2.8
	httparse@1.8.0
	httpdate@1.0.2
	humantime@2.1.0
	hyper-timeout@0.4.1
	hyper@0.14.23
	indexmap@1.9.2
	indoc@1.0.8
	inout@0.1.3
	ip_network@0.4.1
	ip_network_table-deps-treebitmap@0.5.0
	ip_network_table@0.2.0
	itertools@0.10.5
	itoa@1.0.5
	js-sys@0.3.60
	lazy_static@1.4.0
	libc@0.2.139
	lock_api@0.4.9
	log@0.4.17
	managed@0.8.0
	matchers@0.1.0
	matchit@0.7.0
	memchr@2.5.0
	memoffset@0.6.5
	mime@0.3.16
	minimal-lexical@0.2.1
	miniz_oxide@0.6.2
	mio@0.8.5
	nix@0.24.3
	nom@7.1.2
	num-traits@0.2.15
	num_cpus@1.15.0
	once_cell@1.17.0
	opaque-debug@0.3.0
	parking_lot@0.12.1
	parking_lot_core@0.9.6
	percent-encoding@2.2.0
	pin-project-internal@1.0.12
	pin-project-lite@0.2.9
	pin-project@1.0.12
	pin-utils@0.1.0
	poly1305@0.8.0
	ppv-lite86@0.2.17
	pretty-hex@0.3.0
	proc-macro2@1.0.49
	prost-derive@0.11.6
	prost-types@0.11.6
	prost@0.11.6
	pyo3-asyncio@0.17.0
	pyo3-build-config@0.17.3
	pyo3-ffi@0.17.3
	pyo3-log@0.7.0
	pyo3-macros-backend@0.17.3
	pyo3-macros@0.17.3
	pyo3@0.17.3
	quote@1.0.23
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	redox_syscall@0.2.16
	regex-automata@0.1.10
	regex-syntax@0.6.28
	regex@1.7.1
	ring@0.16.20
	rustversion@1.0.11
	ryu@1.0.12
	scopeguard@1.1.0
	serde@1.0.152
	serde_derive@1.0.152
	serde_json@1.0.91
	sharded-slab@0.1.4
	signal-hook-registry@1.4.0
	slab@0.4.7
	smallvec@1.10.0
	smoltcp@0.8.2
	socket2@0.4.7
	spin@0.5.2
	subtle@2.4.1
	syn@1.0.107
	sync_wrapper@0.1.1
	synstructure@0.12.6
	target-lexicon@0.12.5
	termcolor@1.1.3
	thread_local@1.1.4
	tokio-io-timeout@1.2.0
	tokio-macros@1.8.2
	tokio-stream@0.1.11
	tokio-util@0.7.4
	tokio@1.24.1
	tonic@0.8.3
	tower-http@0.3.5
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-attributes@0.1.23
	tracing-core@0.1.30
	tracing-futures@0.2.5
	tracing-subscriber@0.3.16
	tracing@0.1.37
	try-lock@0.2.4
	typenum@1.16.0
	unicode-ident@1.0.6
	unicode-xid@0.2.4
	unindent@0.1.11
	universal-hash@0.5.0
	untrusted@0.7.1
	untrusted@0.9.0
	valuable@0.1.0
	version_check@0.9.4
	want@0.3.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.83
	wasm-bindgen-macro-support@0.2.83
	wasm-bindgen-macro@0.2.83
	wasm-bindgen-shared@0.2.83
	wasm-bindgen@0.2.83
	web-sys@0.3.60
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.42.0
	windows_aarch64_gnullvm@0.42.0
	windows_aarch64_msvc@0.42.0
	windows_i686_gnu@0.42.0
	windows_i686_msvc@0.42.0
	windows_x86_64_gnu@0.42.0
	windows_x86_64_gnullvm@0.42.0
	windows_x86_64_msvc@0.42.0
	x25519-dalek@2.0.0-pre.1
	zeroize@1.5.7
	zeroize_derive@1.3.3
"

inherit cargo distutils-r1

MY_P=mitmproxy_wireguard-${PV}
DESCRIPTION="WireGuard frontend for mitmproxy"
HOMEPAGE="
	https://github.com/decathorpe/mitmproxy_wireguard/
	https://pypi.org/project/mitmproxy-wireguard/
"
SRC_URI="
	https://github.com/decathorpe/mitmproxy_wireguard/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD ISC MIT
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~x86"

BDEPEND="
	dev-python/setuptools-rust[${PYTHON_USEDEP}]
"

QA_FLAGS_IGNORED="
	usr/lib.*/py.*/site-packages/mitmproxy_wireguard/mitmproxy_wireguard.*.so
"

src_test() {
	cargo_src_test
}
