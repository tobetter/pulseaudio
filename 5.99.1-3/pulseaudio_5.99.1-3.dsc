-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.99.1-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 7a84bc008c64ab00153756c2696ecffcd41e0881 1454240 pulseaudio_5.99.1.orig.tar.xz
 1dfb5551f9157ac98909e1020323f02cd0d0418f 31312 pulseaudio_5.99.1-3.debian.tar.xz
Checksums-Sha256:
 589d3623c5458b2b831a107c49d16da69afed5b2cfa545353da90df1a3e84fbf 1454240 pulseaudio_5.99.1.orig.tar.xz
 6b8b8d8dc3185f24b74dca67ea1448a6d7617e094de91856c95c74ccd9b77bb8 31312 pulseaudio_5.99.1-3.debian.tar.xz
Files:
 ce6fae362378d5b1c7d4d52235dc8219 1454240 pulseaudio_5.99.1.orig.tar.xz
 09f026ee89f2946349134cef7413eb77 31312 pulseaudio_5.99.1-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJUiQhqAAoJEKO6uuJAjdbPKT8P/1NfLtlDERvBKnEmvjluB66V
dXDElNOSQZJAWk+jhs5qOSzt/yVdSHU6XB68rYcD0u2acA1oB5kKhQpK5MkKyKbu
ReoTdFC68E0BZ5J2eBZRn0I8znAPGov3eW+Avv6GZJ/Bc3zsLP0b7qzSLwpBEyIS
Z+vfOWm5xrv6Po5kySsbGndVscVHwbDz2mrskoiKPZSk8I+7APK7hgqGSv/uTdVa
8C/4tu1xwUfGC2iCQmogS2DFvZbLi4T9fPhPYZDpIIVPVamFiPmCFkRWToU9CIUF
LVEIh1U7oeZVGDWmpfDyqh6jc7VBaO8ULO4CHVJeKjgm3IJkacEaokoP3YAUsfVJ
ZLCtOvNqTZKoWxIhpantzgq7o7AeqCf/psaF8c5izpQ2tZGR7RMDKJLx5hvgShPx
Ca8IY9Redvy0TnceCZKgT60TchprRADAGbKXRc/XLJAffp3ZpsOxbozboKySCDRS
m1H2bQX8dmCVHkzAI6kyZedahAJsA7gYqmblUqNBBi4S3KxdPX+XVxTnK0miE1Hv
Io+uLIBNJ6XWby2JA08kmL23owV+hGA1OsiEux1CnCoKAE6/zTj03OCn9eIWH5NT
lVBJddq/ZOxjGErKrR0VHsSioR2VZwPRFWzw2sxtTCZ5+ZQ9FBHVdH6HZPlG3VJK
EJueJzEBu/02a7cws3Uz
=ZZRb
-----END PGP SIGNATURE-----
