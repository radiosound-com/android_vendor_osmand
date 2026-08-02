# Caramel Vanilla OsmAnd prebuilt

This repository supplies the OsmAnd Automotive APK and the open-source
Caramel Vanilla templates host used by the Raspberry Pi 5 product.

Copyright 2026 Radio Sound, Inc. The original product-integration metadata and
templates-host packaging in this repository are licensed under the
[Apache License 2.0](LICENSE-APACHE-2.0). The bundled OsmAnd APK and its source
remain under the upstream OsmAnd licenses; the repository's
[OsmAnd license notice](LICENSE) must be preserved.

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

The bundled templates-host source is maintained in
[`android_packages_apps_Car_TemplatesHost`](https://github.com/radiosound-com/android_packages_apps_Car_TemplatesHost)
at commit `8d7ae46`.

Related published source:

* [Caramel Vanilla templates host](https://github.com/radiosound-com/android_packages_apps_Car_TemplatesHost)
* [Caramel Vanilla manifest](https://github.com/radiosound-com/caramel-vanilla-manifest)
* [Raspberry Pi 5 device integration](https://github.com/radiosound-com/android_device_brcm_rpi5/tree/caramel-vanilla-aaos)
* [OsmAnd AAOS fork](https://github.com/radiosound-com/OsmAnd/tree/caramel-vanilla-osmand-aaos)
