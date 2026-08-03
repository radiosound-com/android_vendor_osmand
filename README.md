# Caramel Vanilla OsmAnd prebuilt

This repository supplies the OsmAnd Automotive APK used by the Raspberry Pi 5
Caramel Vanilla product.

Copyright 2026 Radio Sound, Inc. The original product-integration metadata and
packaging in this repository are licensed under the [Apache License 2.0](LICENSE-APACHE-2.0).
The bundled OsmAnd APK and its source remain under the upstream OsmAnd
licenses; the repository's [OsmAnd license notice](LICENSE) must be preserved.

The APK is built from the `caramel-vanilla-osmand-aaos` branch of
[`radiosound-com/OsmAnd`](https://github.com/radiosound-com/OsmAnd), currently
pinned to commit `ef00fe64613`. The current product artifact includes the
arm64-v8a native map renderer and contains two entrypoints:

* `OsmAnd Nightly`: the Android Automotive templates UI via `CarAppActivity`.
* `OsmAnd Full UI`: the ordinary `MapActivity`, intended for downloads and
  other parked-only tasks.

The APK is stored with Git LFS because it is larger than GitHub's regular-file
limit. Install Git LFS before syncing the Android checkout. The product build
re-signs it with the platform certificate.

Templates Host and Aurora Store are packaged independently in
[`android_vendor_car_templates_host`](https://github.com/radiosound-com/android_vendor_car_templates_host)
and [`android_vendor_aurora_store`](https://github.com/radiosound-com/android_vendor_aurora_store).
