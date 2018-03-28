-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu4
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 53bde72b6bfe715c19b1519db8845f7a58346b67 1648924 pulseaudio_11.1.orig.tar.xz
 418bbf4fda7e8b2665b659d3173e2f8bd71673e1 94244 pulseaudio_11.1-1ubuntu4.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 09e7545c25fbfda8afa39729ee4954020c8ef20c30a67a162668d289e6f63187 94244 pulseaudio_11.1-1ubuntu4.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 19fc1dc83fbf01202c6d9b3783f7d3ec 94244 pulseaudio_11.1-1ubuntu4.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJaWDQ1AAoJENTbSp9dBE8ar1EP/0CJSXg2Zvr5omM8FLcq6jgu
VmIjylSl39ngn1KFp1WMnNvzDigSDEgQi36OsK78Trmc8okmyn4eXNIDmvSq9GUD
l40U07zEe3mgq6nop69IX8xU2wx8P5Fc+BtK5mj3ESQ5+EkMOAfu7Vzf1qfVoHKp
zu2oVFlY7qpiHZhB6I7W3lV1xe47I1zciQzvhrD9YT8hQ40YBIHLBpyHEnOtL3hl
7BoI7P10xzXXExDhf6kVWCjctuUyh02pisl6BofwU89gsVUPv4iLHUoCfbw3iCnE
SlseCRVachl96WGztIDnP2CF28hOzzwvB/ND6+l9oMjAZJjAw/ubQmuXvKZJTBpt
vUm56ROExd/tHrR6UKmo6LkKoX+Ioo325A+cmBqvo7m5J7lEUEyImQnleE6JYSIx
67V+ePHFCJD1RFJJxRIywjHCeYB3lbYIuiGSlwq3DTwfmCUknsZv+pOdSqXo0w6c
cjjJDHDhxqsOEKSOK/zy8dRuDRYNykD2/CCH5vmKa9MVay7CHHUWGOW2LKMzPO0c
LNVsPOesaM1tfRj3Ey3O/DCA76tbze2HOANmnXSAc0Lmhd4yvECRFO7qbwpMnFs9
SZG/F8wQI3h4ux4ZpQNtJLH1ro/EogC1NosbtHsLnBH4AFsMxrQZ/6hPMHrcGb3Z
dcit7RbGjfjVrNhf3dZY
=g8C0
-----END PGP SIGNATURE-----
