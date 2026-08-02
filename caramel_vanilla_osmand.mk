# Caramel Vanilla maps app.
#
# The APK is platform-signed by the product build. It is an Android Automotive
# CarAppActivity entrypoint with a separate launcher alias for the full UI.
PRODUCT_PACKAGES += CaramelVanillaOsmAnd CaramelVanillaTemplatesHost

# AOSP publishes the templates-host feature declaration here. The actual
# renderer service is not part of the open-source Android 16 tree. The
# CaramelVanillaTemplatesHost prebuilt below supplies the compatible renderer.
$(call inherit-product, packages/apps/Car/Templates/CarTemplatesHost.mk)
