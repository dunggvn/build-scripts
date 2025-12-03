#remove the current manifests
rm -rf prebuilts/clang/host/linux-x86 device/lge/flashlmdd vendor/lge/flashlmdd device/lge/sm8150-common vendor/lge/sm8150-common kernel/lge/sm8150 hardware/lge

#Syncing rom
repo init -u https://github.com/DerpFest-LOS/android_manifest.git -b 15.2 --git-lfs

#Syncing device trees
git clone https://github.com/lge-qcom-dev/android_device_lge_flashlmdd --depth 1 -b lineage-22.2 device/lge/flashlmdd
git clone https://github.com/lge-qcom-dev/proprietary_vendor_lge_flashlmdd --depth 1 -b lineage-22.2 vendor/lge/flashlmdd

#Syncing common trees
git clone https://github.com/lge-qcom-dev/android_device_lge_sm8150-common --depth 1 -b lineage-22.2 device/lge/sm8150-common
git clone https://github.com/lge-qcom-dev/proprietary_vendor_lge_sm8150-common --depth 1 -b lineage-22.2 vendor/lge/sm8150-common

#Syncing hardware and kernel
git clone https://github.com/lge-qcom-dev/android_kernel_lge_sm8150 --depth 1 -b lineage-22.2 kernel/lge/sm8150
git clone https://github.com/lge-qcom-dev/android_hardware_lge --depth 1 -b lineage-22.2 hardware/lge

#Crave resync script
/opt/crave/resync.sh

#building command
source build/envsetup.sh
lunch flashlmdd-bp1a-user
mka derp
