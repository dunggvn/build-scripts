#remove the current manifests
echo "=====Removing prebuilts...====="
rm -rf prebuilts/clang/host/linux-x86 .repo/local_manifests
echo "=====Removing Done====="

#Syncing rom
echo "=====Initializing ROM...====="
repo init -u https://github.com/DerpFest-LOS/android_manifest.git -b 15.2 --git-lfs
echo "=====Initialize Done====="

#Syncing local manifests
echo "=====Cloning local manifests...====="
git clone https://github.com/dunggvn/local_manifests --depth 1 -b lineage-22.2 .repo/local_manifests
echo "=====Local manifests cloned successfully====="

#Crave resync script
echo "=====Syncing repo...====="
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync
echo "=====Repo sync done====="

#building command
echo "=====Setting up build env====="
source build/envsetup.sh
echo "=====Build env done====="

echo "=====Lunching...====="
lunch lineage_flashlmdd-user
echo "=====Lunching Done====="

echo "=====Start building ROM====="
mka derp
echo "=====ROM Builded successfully====="
