-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu7.1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 53bde72b6bfe715c19b1519db8845f7a58346b67 1648924 pulseaudio_11.1.orig.tar.xz
 ed7a9cf0cddce623bb15c269e7f2f1a2311de6ab 99536 pulseaudio_11.1-1ubuntu7.1.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 3daf97873d6b2a1a0a9878330bd0799ab08eb6c837fd2060a89c923565a3e343 99536 pulseaudio_11.1-1ubuntu7.1.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 5a6083504187f57fed40db37c486592e 99536 pulseaudio_11.1-1ubuntu7.1.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE9q/FE/ywo6zf0Lkwk31r/rPJjt0FAlsC5AUACgkQk31r/rPJ
jt0wRRAApGtVfp6FwUR7pz5Sz5GBsL4qCTKQ1ftXkmWfCUv1TP0C4HormeRpW6am
pmKALjD3uGHpBfnR+tLFjifvNR6CH7uKeROa/aQG8i80XLXMCLeft0VqdpBsZepv
McpDSyCzb03z5Bp7b9GsPt4T/Er/44t/5zskEIqoKwUGjeu/w7ewiAvV1cGHVjJw
3rStALrRrMvEVLF/r5CdnWWR+fzIE2lzoCPZ6L+7KptlI1xCnrG7iPzPvsjYCFXh
nK3UAJWJzosci5bV3LEPqO1y1bv+fpRfqp3qH8Je8X2r16L4mJFoQavUIDTXffSr
y/savRyP4Tfvpp9CarF02sA1mXof9zNR8sy0O26LgMdC8FwcQ4Jp9GBxMRk/bao3
0H51jPEVQGEK2+lLwyZ0nbNGeLmetyB293crMyFPQyZTj4NiNh++Q7mCKXcxHsGw
RU+G8sk8NFvrU5TgSBijQqgrMtEgLnywuIZG7zifUK/lkYZ9GVnxG/av7Ixl9wZA
baiZ19zASY6SM86adhH+qLU/3KSV1RQhfg0GBeNQfuW9EOVQYG2zoWsdr9vYaGta
ODkw1QgSYNEdN2dlfG0QXjTaSkmv4do4tnhfTR1Y3BW2ICS5nbaJc/toW4OKYmbb
FpXHGSNqBQ0HhJ66hu9rBFWlJueMQiyBB1+AG72hgNj/ED2PmTo=
=8ETw
-----END PGP SIGNATURE-----
