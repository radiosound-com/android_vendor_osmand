# Caramel Vanilla OsmAnd prebuilt

This repository supplies the OsmAnd Automotive APK and the open-source
Caramel Vanilla templates host used by the Raspberry Pi 5 product.

The APK is built from the `caramel-vanilla-osmand-aaos` branch of
[`radiosound-com/OsmAnd`](https://github.com/radiosound-com/OsmAnd), currently
pinned to commit `06e5fad`. It contains two entrypoints:

* `OsmAnd Nightly`: the Android Automotive templates UI via `CarAppActivity`.
* `OsmAnd Full UI`: the ordinary `MapActivity`, intended for downloads and
  other parked-only tasks.

The APK is stored with Git LFS because it is larger than GitHub's regular-file
limit. Install Git LFS before syncing the Android checkout. The product build
re-signs it with the platform certificate.

The AOSP tree's `CarTemplatesHost.mk` publishes the
`android.software.car.templates_host` feature and the privileged host
permissions. The `TemplatesHost/CaramelVanillaTemplatesHost.apk` prebuilt
supplies the renderer implementation, is installed as a product privileged app,
and is platform-signed during the AOSP build. It supports the navigation/list
templates used by OsmAnd and preserves the separate full-UI launcher for
downloads and other parked-only tasks.
