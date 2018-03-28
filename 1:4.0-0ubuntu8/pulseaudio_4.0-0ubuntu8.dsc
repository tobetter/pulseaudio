-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:4.0-0ubuntu8
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), dh-autoreconf, dh-translations, intltool, libasound2-dev (>= 1.0.19) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk2.0-dev, libhardware-dev [armhf], libice-dev, libjack-dev (>= 0.117.0), libjson0-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsbc-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libtdb-dev, libudev-dev (>= 143) [linux-any], libsystemd-daemon-dev [linux-any], libsystemd-login-dev [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List: 
 libpulse-dev deb libdevel optional
 libpulse-mainloop-glib0 deb sound optional
 libpulse-mainloop-glib0-dbg deb debug extra
 libpulse0 deb libs optional
 libpulse0-dbg deb debug extra
 libpulsedsp deb sound optional
 libpulsedsp-dbg deb debug extra
 pulseaudio deb sound optional
 pulseaudio-dbg deb debug extra
 pulseaudio-esound-compat deb sound optional
 pulseaudio-esound-compat-dbg deb debug extra
 pulseaudio-module-bluetooth deb sound extra
 pulseaudio-module-bluetooth-dbg deb debug extra
 pulseaudio-module-gconf deb sound optional
 pulseaudio-module-gconf-dbg deb debug extra
 pulseaudio-module-jack deb sound optional
 pulseaudio-module-jack-dbg deb debug extra
 pulseaudio-module-lirc deb sound optional
 pulseaudio-module-lirc-dbg deb debug extra
 pulseaudio-module-raop deb sound optional
 pulseaudio-module-raop-dbg deb debug extra
 pulseaudio-module-x11 deb sound optional
 pulseaudio-module-x11-dbg deb debug extra
 pulseaudio-module-zeroconf deb sound optional
 pulseaudio-module-zeroconf-dbg deb debug extra
 pulseaudio-utils deb sound optional
 pulseaudio-utils-dbg deb debug extra
Checksums-Sha1: 
 9f0769dcb25318ba3faaa453fd2ed0c509fa9c5c 1392072 pulseaudio_4.0.orig.tar.xz
 659f882eca5800e619a186dc89225988e4f3944e 70320 pulseaudio_4.0-0ubuntu8.debian.tar.xz
Checksums-Sha256: 
 35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae 1392072 pulseaudio_4.0.orig.tar.xz
 5c385b33396081afafba23f798e08a7ff012bb33c11cf26c4aee513f6ae0dd3a 70320 pulseaudio_4.0-0ubuntu8.debian.tar.xz
Files: 
 591f211db2790a7e4d222f2dc6858db3 1392072 pulseaudio_4.0.orig.tar.xz
 5dd88beefbdb63bba0621aac0e3d10ae 70320 pulseaudio_4.0-0ubuntu8.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Testsuite: autopkgtest

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTDAO0AAoJEHNgbJmxYiOjQbYP/3ZfxVLUm5+4JNaXYWVK2cb2
dnO+zpoIcKAY7Q2/3PdTirvjxtiN/1K04BOO9DOTrOf3MTZbllWHKN6+mKLqiCnr
19YfxpTLyrSlE1Ykp5b26W7B9MLeFcRbNmA61YMelqpQOWFnC/C7DM1BelV7lrl2
qutLBwC99uCeaAJwuVuMA1gvvfyqX6PUlnhR9kMT7NkhbjRdotyPK+biLAWof8lm
vf+FBOLb3lu763gyhXS+uchU3pbLBNMBc+oDg8KibDwwD2j7lGJarMDT57aiqxBo
KpajictA+XqgPbFifq4rgSdFBLT4BnaqPd3RWRy/IYy2Ni8gX/GHqcc7HPkBtbZL
ldKiuAVhAOOvuUZI2lj6z8lnppd0EGm+v9RZ/ypS2QJYHZjGhfV3khZO4NGidPKi
OwBXo39QwDRT0iJfchgquO9QfKyKU+V0Y7XM/r3NNgaFuvAB24hfrqBPMIgPR4oT
zxsuEl0bbGsclzQq3qJnIP4juo2s8iJETu5+1BaK7whcplR3kVdu4u7ofw+2ZoH+
hMX8oUJz0wWLAY81AM6tUgltwI7JCBqZck2ISTdXg6uUHn7SyJnv+GGiCKCTgs8O
f3h77jxALSUwcEonmLQbnYwi4rfFV4ysj0etWUS/TDSkyXThe6BX06RfBl31F9hi
1ChmZZJamuZhVKWKdSh/
=sE79
-----END PGP SIGNATURE-----
