-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.2-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 310a6245036a51df6585a7ebfac75b32e073aa88 1665092 pulseaudio_12.2.orig.tar.xz
 f8ce3b07e7d3e8e293953d7a167b345d7aba0850 32504 pulseaudio_12.2-1.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 2c643988d7a00af63eb5248fa8a5c104006c90652b8db18f004e5bbf3122b35e 32504 pulseaudio_12.2-1.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 fff0a967430ecdd9d78a8e69e791e78b 32504 pulseaudio_12.2-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAluRg3QUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+IHg//Rj4dy3z1ZhnyEkn5qEnKwxYqH6xp
bytRY8SPHhjyFkH3hO4n8srmzSr85abIw7FJ/2Qppu5xQ+An9V+dBTmLML4d0BDh
qvKKLmjjhfsJh9Ru5DdiPYOZCnLCSzn3nWUKJ9dCiv6RsBeJAZpC2lZfGDuf4BuX
76nR0ZxhA8jgmZxI6hw3wYIH8BcCglciGdV6zAUHScQQW2QjQa49itwDk/7DPycp
p+nQysSJ3G5A8FI7YV1JXQr9//icbbnUAO/1Cup4OCs8c//X48E2CNhUGjCEFoVL
BDSv08DwGrVHAbMdGPoc916JqopZuQgMshX28wO5Wj9KHZ8PilxRW1KEvmHLpsAO
Vx9gn+EMVFvSUeMUC7/byuWECXTeLfQ4Qy1HeHavqpaTIOirEL3+1I6ZKz6w9u4y
FEY/9pBR2WqyoFD0Dle559U0dgc0KELxZtIoWLvQjozeeZB3yysjb83Mqq9Axxpl
B8UuKyDMNmpsMt7hRDATQkpiUnsHoxXM4RP6PxcKMAy3PRJftBP9CJICSJnznGeJ
1xW4CV6AO5J3xlO591uVIrwCvX42YQ7WhlUcONJ+ApXhsHMY0LwECKZQClBuIvrt
w909FtrRuWTFPqMrKxSsUBT3mfN0EPnrCUfTtyjLlqMiYNgq72c/zaboUDry24fM
oStPAsIaOyzxjEw=
=A37h
-----END PGP SIGNATURE-----
