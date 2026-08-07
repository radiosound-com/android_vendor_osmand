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

The AOSP tree's `CarTemplatesHost.mk` publishes the
`android.software.car.templates_host` feature and the privileged host
permissions. The `TemplatesHost/CaramelVanillaTemplatesHost.apk` prebuilt
supplies the renderer implementation, is installed as a product privileged app,
and is platform-signed during the AOSP build. It supports the navigation/list
templates used by OsmAnd and preserves the separate full-UI launcher for
downloads and other parked-only tasks.

The bundled templates-host source is maintained in
[`android_packages_apps_Car_TemplatesHost`](https://github.com/radiosound-com/android_packages_apps_Car_TemplatesHost)
at commit `3f956de` (`Polish map route preview card`).
The bundled templates-host APK SHA-256 is
`ba51768bf49102a2aa6707c1ef1bfca291696c46e41e14df9946643c359126f3`.
The route-preview renderer now sizes the map card to its content, removes
decorative placeholder bullets, and renders the primary navigation action as
a filled control while leaving generic templates unchanged.

Related published source:

* [Caramel Vanilla templates host](https://github.com/radiosound-com/android_packages_apps_Car_TemplatesHost)
* [Caramel Vanilla manifest](https://github.com/radiosound-com/caramel-vanilla-manifest)
* [Raspberry Pi 5 device integration](https://github.com/radiosound-com/android_device_brcm_rpi5/tree/caramel-vanilla-aaos)
* [OsmAnd AAOS fork](https://github.com/radiosound-com/OsmAnd/tree/caramel-vanilla-osmand-aaos)
