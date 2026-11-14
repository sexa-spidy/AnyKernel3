### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Kernel for Galaxy A51 4G (a51)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=a51
supported.versions=13 - 17
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

# boot shell variables
BLOCK=/dev/block/platform/13520000.ufs/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# Make the dtbo partition visible to ak3-core's flash_generic (Exynos platform path)
DTBO_PART=/dev/block/platform/13520000.ufs/by-name/dtbo
if [ ! -e /dev/block/by-name/dtbo ] && [ ! -e /dev/block/bootdevice/by-name/dtbo ] && [ -e "$DTBO_PART" ]; then
  mkdir -p /dev/block/by-name
  ln -sf "$DTBO_PART" /dev/block/by-name/dtbo
fi

# boot install
dump_boot;

write_boot;
## end boot install
