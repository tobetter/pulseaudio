-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 13.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
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
 dd07a49f09821913c5ed1b131ea7f85f27085d0b 1901768 pulseaudio_13.0.orig.tar.xz
 3197be8a40303e028a89a24bcb98a1a46d7b8c90 32732 pulseaudio_13.0-1.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 5d7bb27c094fa7b878ca8a19e9cd529cf4fa6bfedfb49e3b2f5bfee0b57b1bc3 32732 pulseaudio_13.0-1.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 b0bba7f3e6d059cc56c27f0a6a5efbce 32732 pulseaudio_13.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJdf47yAAoJED69RJA+2wSWxc4QAJVUtAKWBA4SxfiaNLJ5b1ue
56r5w2zT75oIOc7Hw0VohvgyPNoJFTu4MXCJlsK5IWM242mB51w9jQ5hFsrCvs3z
SEsI42KipBp0bj8Lm64NO0XvtnHn5jZoRn6B8thvQ9YFCP886MTBWqn+HplFlWzq
BMt3jjum5KbP+JcZLazBnLuQ6G1egSczvRaRN2kJ7oQQexKQnQXemlG0FSrC4HD1
WpqIHbq7u8tMeV82ekFLwRGoUCSKjw8EBtnxP1o4xfhO23hUDbiVSNMnoEuv0rn5
ftIOh+PRr3Bt2aRRhs0OQAfg3mYypjHw002HdFQ06wksDMVOZTz3ezvvNKYB34EN
cvYbw7TvMud6R8P8Tvp7Jz1rUvd9ATh4CJ49MlJq0ABNCJGMwRHw6XzZ4I5JQzQZ
20+HJGqSp34U3oa4BsReaLNw4gAyxSCEMy7gFjd0OnwIpdkamJ78OJlD0oYE0cjO
KImqMwR86wgo/ShoHVNL/uC4DzJBybo08mJQ6Sw7lt42ulwFlPsgsAubRIw/vZWC
H40ulvBn930ZBnRwrwp+xQefG1f6VgnKCm33xWN5/Hrh1lMmXWstLlY1GYXnqA63
b2ZXfX7FaQBC01ux8uk6K9cgG9sLERh03JnuxQwvS5fe4X5ggYjbIh58yNJAS3Q+
f/ENf4DjUa7W9zknSwG9
=MFlF
-----END PGP SIGNATURE-----
