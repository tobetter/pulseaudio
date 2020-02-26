-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:13.99.1-1ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.5.0
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libglib2.0-dev, libgstreamer1.0-dev, libgstreamer-plugins-base1.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 3a8f0c81694eb423f7f9ab5f2cb16f81c0ffceb5 1955840 pulseaudio_13.99.1.orig.tar.xz
 3d0696668007ca48f2f2b2605e91f9f3693cf901 83568 pulseaudio_13.99.1-1ubuntu1.debian.tar.xz
Checksums-Sha256:
 e6a111cc078e6039bf657a3fd1f73dc804c8ee362ca03a0732dc5c38c13e0a0c 1955840 pulseaudio_13.99.1.orig.tar.xz
 c41103ffef9baa4386338a38be68d0e879b8b983939ca561ec2a74d7df148e51 83568 pulseaudio_13.99.1-1ubuntu1.debian.tar.xz
Files:
 5cafff810bd6f0bf793912981ab0affa 1955840 pulseaudio_13.99.1.orig.tar.xz
 11fe5baf182f3eca4d4f02071a4dfc3b 83568 pulseaudio_13.99.1-1ubuntu1.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5WVUEACgkQQxo87aLX0pJdowCeMXA84YHsBkJRFvsaS6GxHKgM
WKMAoNRSeie3D58RhKGUEg17eyS21P85
=FtA/
-----END PGP SIGNATURE-----
