-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.1-5
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
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 53bde72b6bfe715c19b1519db8845f7a58346b67 1648924 pulseaudio_11.1.orig.tar.xz
 cb1460152eda632b44b42a87f3fd6643f648744d 46160 pulseaudio_11.1-5.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 1484bda9615566d348f285b2475b854ab0ea1da16a6d2362af6f085323c899df 46160 pulseaudio_11.1-5.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 0410ccb6a7f87408c49d253929215ec3 46160 pulseaudio_11.1-5.debian.tar.xz
Dgit: 04f538987ebff1d78e40420b6b2d846e5d999d7e debian archive/debian/11.1-5 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlrGdRoUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/ucw/+O0uf4AULtv/79wJFrGy035lHv5RW
HggsyQjZuGcvVrw6HyYuE76UtSrzQDTG1Ey+b8JKhtYsoPFXW101V/rx1pJILEnW
8jctNIRSmgxKBaYEtgew1MEO2Xi6UxEhmxUeaG1RL9NQw0SQFjSk4oND98oaZx7F
dYJPNrfKKzA2GztNYGuYG2GySckWGwuE2NYovSetkiMzeMCTgFJgWc+XZlI+kten
jND2oE2PJD1XdGgPTbQ/66CRf1+my5SLj1/YgW2DNQSopl5jUgeoWIE1mwpNn3GD
TRVLWMfh3DAbkWnwnDap2npEJT4V95rhkkDTqBdaa+Bk5hqb6clOmHR6OwqYEPg0
+1/lvINLAPsmJg5o9F7LGMVOEGNL67ndkw++9lUpZRj5jj32+rApdiVjg6uCmxPV
Iz4hgrJfyl/oNlkIKjijwJOhm61eZCt//ni9kAZ1uUrG5/Fcf9pIr0G+VfAKZBVQ
Hm8e9pVXfPwIyH7Z+6Xc0nLVReoFcbw0m3EqUU880c00JjG43jPi59bK2b1KlcHq
GEvj90PdKLWNYC9De5PFirH0R4CEkv+bniZfCFs4d8RDPT4eTrBtw54M3Yv5S3f9
S4MaRjMrcnf0xcP85tX+CVF9ACEF1x3s4dECDqo+erm1m80lVUhx8Grc9fk+9m0h
W3FEFFdZSC3YPU0=
=gKmq
-----END PGP SIGNATURE-----
