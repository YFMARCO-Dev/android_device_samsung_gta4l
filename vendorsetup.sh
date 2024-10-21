git clone --depth=1 https://github.com/YFMARCO-Dev/android_device_samsung_gta4l-common -b orion-14 device/samsung/gta4l-common
git clone --depth=1 https://github.com/YFMARCO-Dev/proprietary_vendor_samsung_gta4l-common -b fourteen vendor/samsung/gta4l-common
git clone --depth=1 https://github.com/YFMARCO-Dev/proprietary_vendor_samsung_gta4l -b fourteen vendor/samsung/gta4l
git clone --depth=1 https://github.com/YFMARCO-Dev/android_kernel_samsung_sm6115 -b fourteen kernel/samsung/sm6115
git clone --depth=1 https://github.com/YFMARCO-Dev/android_hardware_samsung.git -b aosp hardware/tmp
cp -r hardware/tmp/* hardware/samsung/
rm -rf hardware/tmp

mkdir prebuilts/clang/host/linux-x86/clang-neutron; cd prebuilts/clang/host/linux-x86/clang-neutron;
curl -LO "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman";
chmod +x antman; ./antman -S=05012024; ./antman --patch=glibc; cd ../../../../../;sed -i '/CLANG_EXTRA_FLAGS += --hip-path=\/dev\/null/d' vendor/lineage/build/tasks/kernel.mk;
