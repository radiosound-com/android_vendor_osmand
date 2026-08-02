# Caramel Vanilla OsmAnd prebuilt

This repository supplies the OsmAnd Automotive APK used by the Caramel Vanilla
Raspberry Pi 5 product.

The APK is built from the `caramel-vanilla-osmand-aaos` branch of
[`radiosound-com/OsmAnd`](https://github.com/radiosound-com/OsmAnd), currently
pinned to commit `06e5fad`. It contains two entrypoints:

* `OsmAnd Nightly`: the Android Automotive templates UI via `CarAppActivity`.
* `OsmAnd Full UI`: the ordinary `MapActivity`, intended for downloads and
  other parked-only tasks.

The APK is stored with Git LFS because it is larger than GitHub's regular-file
limit. Install Git LFS before syncing the Android checkout. The product build
re-signs it with the platform certificate.

The AOSP tree's `CarTemplatesHost.mk` only publishes the
`android.software.car.templates_host` feature and permissions. It does not
contain a templates renderer implementation. A runtime image must provide a
compatible host (the Google Automotive AVD does); this prebuilt does not copy
proprietary host software into the open-source product.
