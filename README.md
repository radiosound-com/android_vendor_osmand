# Caramel Vanilla OsmAnd prebuilt

This repository supplies the OsmAnd Automotive APK used by the Raspberry Pi 5
and Caramel AVD products.

Copyright 2026 Radio Sound, Inc. The original product-integration metadata and
templates-host packaging in this repository are licensed under the
[Apache License 2.0](LICENSE-APACHE-2.0). The bundled OsmAnd APK and its source
remain under the upstream OsmAnd licenses; the repository's
[OsmAnd license notice](LICENSE) must be preserved.

The APK is built from the `caramel-vanilla-osmand-aaos` branch of
[`radiosound-com/OsmAnd`](https://github.com/radiosound-com/OsmAnd), currently
pinned to commit `f82991b` (`Process cold-start Automotive navigation
intents`). It contains two entrypoints:

* `OsmAnd Nightly`: the Android Automotive templates UI via `CarAppActivity`.
* `OsmAnd Full UI`: the ordinary `MapActivity`, intended for downloads and
  other parked-only tasks.

The APK is stored with Git LFS because it is larger than GitHub's regular-file
limit. Install Git LFS before syncing the Android checkout. It is signed with
the dedicated Caramel OsmAnd release identity and the product build preserves
that signature, allowing repository-delivered updates without distributing the
Android platform key.

Rebuild the pinned Automotive artifact with:

```text
cd OsmAnd
ANDROID_HOME=/path/to/android-sdk ANDROID_NDK=/path/to/android-ndk \
  ./gradlew assembleNightlyFreeLegacyFatAutomotive
```

The bundled APK SHA-256 is
`14e6455ab822d9ca9b24bfb5b44e8f5c16657cc2b6baf01c745183604e692a49`.
Its signing-certificate SHA-256 is
`729114e97e3dbbf4d5d300fbf40bd72f99142ae15fdc5bfe57adc37b63dc4a18`.
This artifact includes the native `libosmand.so` and `libc++_shared.so`
libraries; the exact OsmAnd native-core inputs used to assemble it are locked
in [`provenance/SOURCES.lock`](provenance/SOURCES.lock). A wrapper-only build
that omits those inputs produces an APK that cannot load the offline map core.

The Caramel templates-host APK is packaged separately by
[`android_vendor_car_templates_host`](https://github.com/radiosound-com/android_vendor_car_templates_host).
Keeping that module in its own vendor project avoids duplicate Soong module
definitions when the manifest syncs the split application packages.

Related published source:

* [Caramel Vanilla templates host packaging](https://github.com/radiosound-com/android_vendor_car_templates_host)
* [Caramel Vanilla manifest](https://github.com/radiosound-com/caramel-vanilla-manifest)
* [Raspberry Pi 5 device integration](https://github.com/radiosound-com/android_device_brcm_rpi5/tree/caramel-vanilla-aaos)
* [OsmAnd AAOS fork](https://github.com/radiosound-com/OsmAnd/tree/caramel-vanilla-osmand-aaos)
