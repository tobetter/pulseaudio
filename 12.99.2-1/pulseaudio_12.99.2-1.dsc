-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.99.2-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 539b3aecd3e84309f0c4e7c3f9dcce094e0cae43 1940172 pulseaudio_12.99.2.orig.tar.xz
 7705dd4f8bb6515b5f0c4e43215052678bc6e04b 32608 pulseaudio_12.99.2-1.debian.tar.xz
Checksums-Sha256:
 a8f29c719fc317d7e4b86a468d82a8f7619a49e024748606a2f2d3d68b3a4a3f 1940172 pulseaudio_12.99.2.orig.tar.xz
 d43025430cbe601f7000b13b49be952c8cddcb970b6e595c568218de6960a7ee 32608 pulseaudio_12.99.2-1.debian.tar.xz
Files:
 ae5f0653a4c4af301ea175b283b25f8c 1940172 pulseaudio_12.99.2.orig.tar.xz
 b840d80add9c5ae64370f58085345f23 32608 pulseaudio_12.99.2-1.debian.tar.xz
Dgit: 6ac7e6e5a12dfc40b2414bfb7dff67d1a0d8f5e2 debian archive/debian/12.99.2-1 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAl1d+fkUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/VxQ//YJJclgxENcWHFTIzgtgenElI78UQ
xkzk/kcELjmzP9uOlbwi11A6qduz+kbMtlKVsWgNO85yQKWuY23D5ZZNy2rId3Z+
w6lNHmN6YCkEAG+RMn4hZ+SIa61KsAi5ao4jG1tDo1sSLZPDZsdgkAaQ0MFMU3U3
gY9kAng+h2fa5+yxZyrZn5zEIKwM2wjucwQuXEYLsJmWBbs0c0oAUViDYp2/K8F+
6V+mIXhSaC9B55cYglcvkhndIJrxa5kJWJJN65hIFUsNO5g/SNgYc7flwqYwcss2
uIVbTdLWORmTvuY3wm0+J6PcML0k2tjY9CAdSQAbjMZA1quBaqYgJPDXfW5Jwxfb
qhywowJyIMusuMJskS4xLk9KuyG7JG+nij9nlY80whEDjGawHCTXCZ3ZfhlZaYsY
0EDzzwa+sU7m4VAWalUoguMCu6RLgC+2dnAe4f2acZt08I2Ha9ayj//Wt1ykOCxP
0US+ZQmA8yQ7+/EyJbuWrMKm8xmfO/cSG+fk80gViiZV16sNEunLEj4I/RZwtgkt
rPMmvKupM5zwinkDxyRTCbjskuw8VcheViL+oa41cK8ZzYuBTKj7tqFmOVeelqkQ
HC4xUZKLzAs+KaeAE1ci7CjeqL5dqZP0V9viJ3wcfiUx1ma/33rGDZVwfL25Z++p
KIdws6+kOwvPMNE=
=1uTA
-----END PGP SIGNATURE-----
