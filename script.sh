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

#Extras
echo "=====Applying fixes...====="
rm -rf hardware/qcom/sm8150/gps/os_pickup.bp hardware/qcom/sm7250/gps/os_pickup.bp hardware/qcom/sdm845/gps/os_pickup.bp
# git clone https://android.googlesource.com/platform/hardware/qcom/sm8150/gps hardware/qcom/sm8150/gps
# git clone https://android.googlesource.com/platform/hardware/qcom/sm7250/gps hardware/qcom/sm7250/gps
# git clone https://android.googlesource.com/platform/hardware/qcom/sdm845/gps hardware/qcom/sdm845/gps
curl -o vendor/lineage/config/version.mk https://raw.githubusercontent.com/dunggvn/extra_fixes/refs/heads/main/version.mk
echo "=====Fixes applied====="

#Building command
echo "=====Setting up build env====="
source build/envsetup.sh
echo "=====Build env done====="

echo "=====Lunching...====="
lunch lineage_flashlmdd-bp1a-user
echo "=====Lunch success====="

echo "=====Start building ROM====="
mka derp
echo "=====ROM Builded successfully====="
