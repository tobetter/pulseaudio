-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.2-4
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 11), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 310a6245036a51df6585a7ebfac75b32e073aa88 1665092 pulseaudio_12.2.orig.tar.xz
 08b5db0a3c4a4bbe7d34bc0b703717387873d5da 34812 pulseaudio_12.2-4.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 b7d83f693a2b320fb9970f6d6e89bace9672e66833581f751f6f711d7fcf081d 34812 pulseaudio_12.2-4.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 818967f75420cc77391073b998ddab61 34812 pulseaudio_12.2-4.debian.tar.xz
Dgit: 13f23b7dc64b09c76c7f7dfb52224f935a7a9e80 debian archive/debian/12.2-4 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlxl9MMUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s8ayw/9EL5P/Y5PeEz2A95taCCFhuPgL8G4
sQKtEfe/em0iT+dFVm9gmnihBcg2D0HSRSxHLhx6ynWDWGu5s1a1KiH4xNwbZKYx
87lpFB/D7kI6FbNs7b1h7mmZnxBsV/YM+LHLJCdcjE1Z8R1MEAu909pxiD5ftB/5
T16p0R2pwP+18MwgOzIIF1znJXsHipIDxdwC8uAE2mjutNidb0kBRViNvug/6E/1
XuCWVkP1ZZG+R9IzSErEXiWS+6fLUqflTpduU3id2rD61kqAtWpPqNmN683aEmMB
wLvwFgLrJKGYgy6oDoVIV09KnJkoccdQ72QFxEtOq3u8jlTWOAWStgquf4Eu4hSa
s64z2ePbMS9R1o+9vCLJJIWIld59pxBhKb+YVLakIfwqSX4OZFcWWo7stsqY9cL7
MOBuuuxhlGkEpOvjh/Un9VVcdDWUifmCy5ksosNgOUILR39NSEPydNMfCtpXiLv8
eJG3tDB8y2Cjb/nWJZpcJlPL6Vp2+jhHCGGz9CATPYgWt4Z0J4F63ks3sEbE05Ma
s93YbKGD+YotkUxiTwSoa/s6cpL0KidO3P9lMe4KkrciO7g7dpDWG2ctdldQT080
NQ2xajqNmI2FCrWqvyugC1UBe4XVvQAG0UVnLa/ZOqaLZImiKqDDvbmvfhLetL3u
rCnnIMNyeg9bvpQ=
=EPPP
-----END PGP SIGNATURE-----
