#remove the current manifests
rm -rf .repo/local_manifests

#Syncing rom
repo init -u https://github.com/DerpFest-LOS/android_manifest.git -b 15.2 --git-lfs
#Syncing device trees

#Syncing common trees
/opt/crave/resync.sh

#building command
source build/envsetup.sh
lunch lineage_flashlmdd-bp1a-user
mka derp
