#remove the current manifests
rm -rf .repo/local_manifests

#Syncing rom and device trees
repo init -u https://github.com/DerpFest-LOS/android_manifest.git -b 15.2 --git-lfs
git clone https://github.com/dunggvn/local_manifests --depth 1 -b aosp .repo/local_manifests
/opt/crave/resync.sh

#building command
source build/envsetup.sh
lunch lineage_flashlmdd-bp1a-user
mka derp
