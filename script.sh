#remove the current manifests
rm -rf .repo/local_manifests

#Syncing rom
repo init -u https://github.com/DerpFest-LOS/android_manifest.git -b 15.2 --git-lfs

#Syncing local manifests
git clone https://github.com/dunggvn/local_manifests --depth 1 -b lineage-22.2 .repo/local_manifests

#Crave resync script
/opt/crave/resync.sh

#building command
source build/envsetup.sh
lunch derp_flashlmdd-user
mka derp
