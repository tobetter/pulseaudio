-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:10.0-2ubuntu3.1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 pulseaudio-module-trust-store deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 ab7cc41a2dc2b9da0794e3a51a4eb7e82e7da511 1608040 pulseaudio_10.0.orig.tar.xz
 04d2aa42b288f4e72aa75857460112968829adf7 95444 pulseaudio_10.0-2ubuntu3.1.debian.tar.xz
Checksums-Sha256:
 a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57 1608040 pulseaudio_10.0.orig.tar.xz
 ffdcd0916eb814221dd93b5bdee95eb82d32090d50ba39cea35da48b47fe4e7a 95444 pulseaudio_10.0-2ubuntu3.1.debian.tar.xz
Files:
 4950d2799bf55ab91f6b7f990b7f0971 1608040 pulseaudio_10.0.orig.tar.xz
 b88b9ea7468efbfd56938086facafe36 95444 pulseaudio_10.0-2ubuntu3.1.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJahAzEAAoJEMtwMWWoiYTcWDcP/iiut6h+0waK0Tm9Ua6iBZIC
5uVo+qs1qgd104WiLBA1Nc5lsSZqZ5bpL38wbkGEQ1SwmcqK+k3IqxtIwZ2NZHUS
Aufv2Z/vg61YBjTB2eXXSGgUYIeDEqbQTNJqXQ5CRdOiHoMdZlhdcfpqlOLX1rDH
hIWcJTuX6aEA7jzHZBAFufqdBBOs6NoXnY49/58c26lovFM961+OJrpgXh2CmF1x
pfXX0l8usF5scniaTC79DGbiPC+TivNBwFm6UbcwwhugL6wezj25uJSPsMfuiPaU
UpsMXqZKlPS4/0oKPf9IbH12EWnQD7M0ZpbYZQBqWkC0OmikIemfnoLq/3sxCkTC
mBztIeBmefQd2VFiSMaBn7jS/LKLyGVsRJHbTdtb4cN5cw6NWIJUyLyq0DCtJOdd
HiuZ0IqMgd1OXmYssK6T5FFd+yYKKtxRQKT/UaC8CApdlAcGNzjwG0fT6AMT7x+I
0bMGv5c758pjkB2ORbdDpvZ46yUzNt7/uEBAWSzKpVy06566u192Zbxig09Hfdio
i49ukVOQ2ooqpudoOvAAO8239eaBadHBBZOPA2X64hsBdUoOwfOXPUdpJm9yVYeI
aRpARD9K33UKbvA1VnpkvMTyEOLav6U6denzNJ8DGQ5JrCz6YvNgKXClKDZU2G9c
Y7IzNCug3hgBw48vPnC2
=Rnex
-----END PGP SIGNATURE-----
