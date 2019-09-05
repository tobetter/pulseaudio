-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:12.99.2-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 683e5071b4befaed5c0c78d0db8a019c24f9f854 83520 pulseaudio_12.99.2-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 a8f29c719fc317d7e4b86a468d82a8f7619a49e024748606a2f2d3d68b3a4a3f 1940172 pulseaudio_12.99.2.orig.tar.xz
 422a8c7e5428a1d024812047a0bbdcd87196e87df0b4557af8f4a05e3f0fad60 83520 pulseaudio_12.99.2-1ubuntu2.debian.tar.xz
Files:
 ae5f0653a4c4af301ea175b283b25f8c 1940172 pulseaudio_12.99.2.orig.tar.xz
 806b57c920dea2e855a838cb178b36a6 83520 pulseaudio_12.99.2-1ubuntu2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEE1WVxuIqLuvFAv2PWvX6qYHePpvUFAl1w7xUQHGRva29AdWJ1
bnR1LmNvbQAKCRC9fqpgd4+m9filEADQiJNQh7fQYlNfDnXQAQF6dzciaOeMDc1E
f8VApe+mbNik1peY0Al+rm/4N32WKuiE+e9IS7AmcP6iJ+xW53PjDBXHKCUyb+Yi
nHGmPkiQlzPHfhhuQUNgnku95Z14cG/hcTXgoM737eWs6s9YfzVFIPpEqLh5mWvr
1a1aomXNFA46baslCLirZuNA8yXYePiytTSH2g0ty04G2cyRwTLJ6OjqVW9dZK3a
oT8r2j6Z61t6tORjAc6wT+yCaiReOQD12MUgSpY01IJJlo5QVq9lAlCSSIW8F7Ld
JkfuussMhYcIIZIfmoE6qmQueuqCcC5gN9lo/uqSJiqCJ7c9TtnQRQKUIXd9xeaj
UI2ClTb4x/J/iohQXcaecfp7jyl7rrUKS4w8abzQyFsCtTN5gcWHSnoFgoOAWL2K
b+43nQRuY+7qm3h+szSlBwlz6WkKY0V9TK3hsoWfGaW7qjSFCPlSC0DoI1zqQG4J
5wXPVmqEv/3EIoCNY/kocgvUcGiXsoMFL2ClZoXurewAiOjfTdXtsW1yRbXittja
FgCOKeO1KM38kO8yk1fsfDjxwSDKj6RYrOMyxyxRWzAM5tIsHtVaFntlrhwKNcNJ
urDO3cEWUPpM0GAX5QzWy31fStSDnT7/EBaZa4Q2jeqDb72mgJ03mT5Vi7n/69iD
uMNpM2L9og==
=hiYL
-----END PGP SIGNATURE-----
