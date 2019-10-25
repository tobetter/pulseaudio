-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 13.0-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: https://www.pulseaudio.org
Standards-Version: 4.4.1
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gsettings deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 dd07a49f09821913c5ed1b131ea7f85f27085d0b 1901768 pulseaudio_13.0.orig.tar.xz
 0ad5296e7901f41d6337300a366a252b3fc4ea78 34144 pulseaudio_13.0-3.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 e8a3cbaf543c26e66f258c3c12a1c1c0a569d61362098780cdcc37f92ebbe1c2 34144 pulseaudio_13.0-3.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 a2c1e8cb0c490cca1af18638aa29dc43 34144 pulseaudio_13.0-3.debian.tar.xz
Dgit: f60dc36ae7eec33b251842066a172cfab34b74ed debian archive/debian/13.0-3 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAl2y5CgUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s9kVxAApjIh396I48x9ZN5lq5FpAlr8XqY1
4ovoagXKJ534Gy1kosoq8JYTWluoYZcWICNpZeEqxi+RM6187rWzI6QK/VYYcApV
mCR0hnn1aEWehy4awre3CLcSL69ek1nMmE2T5bJFEhwbcz1GTTZQkuUDhX5wrPW9
h2pBozgCnUEiqwjiMgicQy7BAd3uDNgFAHq5OMB0SXhJiwjCEElSZSCXOf0YoH9M
HdcB81ywYfq+4pBisufUWK4pbjA9yVo45rw1w9IUrMzjPFmcPKRaU8xp3BFfKWEp
LRzpT/XPc0SLcPem6alqyptrwTC2OvqIUAqJWSsTFZxQzr4HSFiMjY+cWhJR4Yy2
XueXYS3y0A6+20aIJrO8Bl0XEQKhDUy04DVG8GIeZOxf7h8zF8lyToBY7cOtA0H/
gsfHIB8z6393HwwZJcY0JeJUWU2qjItVSn65+tZqzVRYxyRBs0wpUo8/S4+L79GR
HT5dXf4Rvpdq2ZGAcxpHpzSQkrrydhFCHzQaw69ZLSifXB5LKWrNdy52BsR0zZ/z
vrXjEgZOZsE2DJpqRj5r0Umj8g6zTkDt1jz4Bv95O0uRyxLK2f7PQ/+U1qVrH6CT
a7fqHMjt8cyH8CjzZ7eYRIoy+XpRwyA7jhgylCsJGqougHs8q8aeS+3a3EGCbcGF
LjcLUBnTAaynyu8=
=H9Vl
-----END PGP SIGNATURE-----
