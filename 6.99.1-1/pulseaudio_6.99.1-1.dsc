-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 6.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse-mainloop-glib0-dbg deb debug extra arch=any
 libpulse0 deb libs optional arch=any
 libpulse0-dbg deb debug extra arch=any
 libpulsedsp deb sound optional arch=any
 libpulsedsp-dbg deb debug extra arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-dbg deb debug extra arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-esound-compat-dbg deb debug extra arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-bluetooth-dbg deb debug extra arch=linux-any
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-gconf-dbg deb debug extra arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-jack-dbg deb debug extra arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-lirc-dbg deb debug extra arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-raop-dbg deb debug extra arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-x11-dbg deb debug extra arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-module-zeroconf-dbg deb debug extra arch=any
 pulseaudio-utils deb sound optional arch=any
 pulseaudio-utils-dbg deb debug extra arch=any
Checksums-Sha1:
 4c463999562e557801fb47e8ae363c3bb5460ee4 1519340 pulseaudio_6.99.1.orig.tar.xz
 980440747e06241e03ad47dd084faad9b8f5e86c 30092 pulseaudio_6.99.1-1.debian.tar.xz
Checksums-Sha256:
 e0fe622b52cb3d9c82e1845191572845250e68e32faa349aecedc05aff012bac 1519340 pulseaudio_6.99.1.orig.tar.xz
 92b796707e2d9d218eb30edaeaedbcba70011d0ba8a678e9eac291751c26c29f 30092 pulseaudio_6.99.1-1.debian.tar.xz
Files:
 c808839d148ad248358415a7d66aa318 1519340 pulseaudio_6.99.1.orig.tar.xz
 eff965b99143f1f07ea0d612352ff40e 30092 pulseaudio_6.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJV6Qd/AAoJEKO6uuJAjdbPCK0P/137k/MIOLwzy7E9fNbsNghZ
xqu0dlsfWMrlyjTz8TwclU+klTBoDxsraC4k7O0Gd2hfLIanEUTGbEMJoAivxM2v
vcN4u9tjxf/r8anDKZd2pCwEHI//HZeAtOoQBpeoAbkeiWE1dTc38NzdxEZYZUZG
9c5Q8MRwSuSHm7nYqp/eqd0XH+WI6E8Wa2CzmbzzUvuWYyE71IjVebaOKELMby35
EkYe7S7kQRhx3r+n24s4sElv7SjVL/RjiO8gRE1h4eAaoq91vZrE+AjS2wS0NEg0
UNpoIVkdZQcDLM5GUMimvxSKfoxgZmXTay2HGpwoyVHRhS1IHD46xPgf0IPEoxnJ
AkICAd0QeqfeRlhxOoHv3tTgbbAgFBWnqVdn1TztwGga0FMmvsRzCtvFp7HjslAc
GVYALKd1Friye5zMZISwYpkcn4a/JAZZ3g3J49aoZqrBR+vGjKgkYPWTxCHG2Tlw
hYXt+L7agr3gvk5IvkpoWJZ+eSWbEm89WnB5+BQg7zhRcEerN/v34UTzKaRJ9y7w
KE4Qo2iSB+rMX2EyX84rLD7wp07sC/lI6CvRjpr6wWNwWU8HSmwFVqCwe/hJ3juy
02OEKd19DIWf5dwVLT4ccy90nQwH5t2zaYRPC9FSG3VN5tK853ZWxvGbpzHCM0vE
mnHjx49iazbKH3ozKN/k
=WEWD
-----END PGP SIGNATURE-----
