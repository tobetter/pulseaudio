-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.0-4
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064 1537568 pulseaudio_9.0.orig.tar.xz
 a319ae4047ec51d7b85456c577d7beff31fd22db 31224 pulseaudio_9.0-4.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 6d59e8c429f1c19d1a3b1f097ae2910372a81de5cbb4825c399d73b27bb538ce 31224 pulseaudio_9.0-4.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 eaf2287577b3116a9a0c98f98451759c 31224 pulseaudio_9.0-4.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIxBAEBCAAbBQJX+nRtFBxmc2F0ZWxlckBkZWJpYW4ub3JnAAoJEKO6uuJAjdbP
7UAP/Av5Z57ZWMuCVHWKi4Ge8zBSl5ZEybdiVYgy7im0du4s9HqGl/5DzgkyjJ90
rTDjjIRFQu+afPJQHkoGaWelNGlk3Xgzh9EGQTuzJHr5zTCWQ1dKOghc74ilXmsC
uJswDDe1Mx7itVJSNFeKleUy7vVa3JVbZniykdOhuWKCt8GClG0g72lNUiSrS+nv
pXgiKx+1Ehm+WuVuz5HfjVuV//ih12BVDj2OuvU7jqupx98sizdMtz2lfwfvjhuC
wxAnuK3eEVEAcG8LpNXW0HICRbIKj+nNAlnP4zrN8gx+oGXeDDn6HbDb0u1jZWgb
lc30pUjMuYmuoe9tmICur1OHdqQ3Ylb+BTyVcYOfQC0nuoKfuGAEpNHhxGPv6e/U
C1iwG38dZIP3T7G+nM/YYBUbiWt2J+GEONTMZZ0sNTCcypsWwt1U5NPI98fZq6Ki
AXe143fbkqXYhoRY8tUCOWxjwYDSxLgCk4DXK8iaWFdFngABeuxFBTgTSyDSw63a
EvHtvJYdP7LwiAAb5QvK1OC6hnKA6R6UkqCj/zDbtq/Kl+fI2pa+a+fb9ca+HgOJ
5VWdWDDB5K2LR4YzID1bEo9b3ceUlnxaoxWR25Ew3FjXFwasQkOqgOulCt3L1prx
nOOCcGiyKAyIoGkbcamPMDO5XzeFl3u9bKl3P+ylZgwHXGBq
=6Ayl
-----END PGP SIGNATURE-----
