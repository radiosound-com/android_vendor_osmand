# Caramel Vanilla maps app.
#
# The APK is platform-signed by the product build. It is an Android Automotive
# CarAppActivity entrypoint with a separate launcher alias for the full UI.
PRODUCT_PACKAGES += CaramelVanillaOsmAnd

# OsmAnd owns the APP_MAPS and geo:NAVIGATE handlers in this product. The
# Android product make flow does not apply the `-=` shorthand consistently, so
# remove the placeholder explicitly from the accumulated package list.
PRODUCT_PACKAGES := $(filter-out CarMapsPlaceholder,$(PRODUCT_PACKAGES))

# AOSP publishes the templates-host feature declaration here. The actual
# renderer service is not part of the open-source Android 16 tree; a product
# that wants the templated UI must supply a compatible templates host.
$(call inherit-product, packages/apps/Car/Templates/CarTemplatesHost.mk)
