-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu3
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
 21f01560da2afb999a10d87144fc04fbd4407fac 94264 pulseaudio_11.1-1ubuntu3.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 433dd7f8aff433c0da6ac9c21080ab4ea8a560f46f77391ac75b73ddc10ce72f 94264 pulseaudio_11.1-1ubuntu3.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 7d5e590a1bad1ff78f7df341f1c8e4bc 94264 pulseaudio_11.1-1ubuntu3.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJaVzgaAAoJEMtwMWWoiYTcAaEP/2VEEjxsQZ8M+B5EcggyRpBE
O0HZDHpYL478p7SLxI7HDdlJLi40zywJN7aWJLO/Qka2eD4NOuBy87ld6mjoExQV
cQkBQv9Nc9fuwzLSocJa4xnYwfBW6uBf+GAsGQaNB811XAgQZaFnTRm8+2Rh5913
hbryOOQVLakYYuuQCmNBF+CGTRXHKu54VMos3H1R2LFtMK+fRifIYY+LfX5Q2AlF
Ca0Yey7kQ8sJ358uJmH4DAfbGdbgJ0LlHiTGBy4HWoQ+cgbWPuQw/82tawZLMsDn
8Z7qIm+BHuq4Y43tyaH1IbYvWgP3hhyKvq2Bj3A2I+3AInDJ2j+GtRP0BDLFt7iz
clJL2ymO856q96WHfKoQkxg5XljPdG7Ul4Vtv2AJZKgjSj+jHt0dVNW5C4UbT2r7
le94vfuo3MH3KcYYviFXLmtHJraNdd3Mrvahn0W5hKqlhUVJQXqd5qJO5zSc03Yc
PCV5JlyZfoFjRnlKoN7pQa9lK70vwwEZCMgPIEeSMuYBv+QgOkyqAJ3iaLRXaus4
2ngNR+1BUqYeF0ngb9YX9nOZX4kiF+EWWMdeA5/NPl/F5Bc5pgxQb3wybnYOxsa2
Zp+i83OWadUJCZiKMtUNOBO5L+x6qMcq4ljyMuh1Ck2Esw0v/eaGGE9DqtDq89pX
85IMX1Rz0pKMc9pF/ed0
=fh9o
-----END PGP SIGNATURE-----
