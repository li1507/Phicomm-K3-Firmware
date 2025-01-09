#!/bin/bash
echo '添加SSR-Plus软件源'
sed -i "/helloworld/d" "feeds.conf.default"
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
echo '========= SSR-Plus 加载完成！ ========='

echo '添加Passwall软件源'
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git passwallpackages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
echo '========= Passwall 加载完成！ ========='

echo '添加AdguardHome软件源'
git clone https://github.com/kongfl888/luci-app-adguardhome package/lean/luci-app-adguardhome 
echo '========= AdguardHome 加载完成！ ========='

echo '添加lwz322的K3屏幕插件'
rm -rf package/lean/luci-app-k3screenctrl
git clone https://github.com/li1507/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '========= K3屏幕插件 加载完成！ ========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf package/lean/k3screenctrl
git clone https://github.com/li1507/k3screenctrl_build.git package/lean/k3screenctrl/
echo '========= K3屏幕驱动插件 加载完成！ ========='

# echo '添加OpenClash'
# rm -rf package/lean/luci-app-openclash
# mkdir package/luci-app-openclash
# cd package/luci-app-openclash
# git init
# git remote add -f origin https://github.com/vernesong/OpenClash.git
# git config core.sparsecheckout true
# echo "luci-app-openclash" >> .git/info/sparse-checkout
# git pull --depth 1 origin master
# git branch --set-upstream-to=origin/master master
# echo '========= OpenClash 加载完成！ ========='

# echo '添加Haiibo软件源'
# sed -i '1i src-git haiibo https://github.com/haiibo/openwrt-packages' feeds.conf.default
# echo '========= Haiibo软件源 加载完成！ ========='

# echo '添加kenzok8 openwrt-package'
# sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
# echo '========= kenzok8软件源 加载完成！ ========='

# echo '添加kenzok8 small-package'
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# echo '========= kenzok8软件源 加载完成！ ========='

# echo '添加MosDNS'
# rm -rf feeds/packages/net/v2ray-geodata
# rm -rf feeds/haiibo/luci-app-mosdns
# rm -rf feeds/haiibo/mosdns
# rm -rf package/feeds/haiibo/luci-app-mosdns
# rm -rf package/feeds/haiibo/mosdns
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# echo '========= MosDNS 加载完成！ ========='

echo '移除bcm53xx中的其他机型'
sed -i '421,453d' target/linux/bcm53xx/image/Makefile
sed -i '140,412d' target/linux/bcm53xx/image/Makefile
sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
echo '========= 移除bcm53xx中的其他机型完成！ ========='

# 1.'asus_dhd24' 2.'ac88u_20' 3.'69027'
firmware='69027'
echo '替换无线驱动'
wget -nv https://github.com/li1507/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '========= 替换无线驱动替换完成！ ========='
