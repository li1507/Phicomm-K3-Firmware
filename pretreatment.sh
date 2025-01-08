#!/bin/bash

echo '���SSR-Plus���Դ'
sed -i "/helloworld/d" "feeds.conf.default"
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
echo '========= SSR-Plus ������ɣ� ========='

echo '���Passwall���Դ'
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git passwallpackages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
echo '========= Passwall ������ɣ� ========='

echo '���AdguardHome���Դ'
git clone https://github.com/kongfl888/luci-app-adguardhome package/lean/luci-app-adguardhome 
echo '========= AdguardHome ������ɣ� ========='

echo '���lwz322��K3��Ļ���'
rm -rf package/lean/luci-app-k3screenctrl
git clone https://github.com/li1507/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '========= K3��Ļ��� ������ɣ� ========='

echo '�滻lwz322��K3��Ļ�������'
rm -rf package/lean/k3screenctrl
git clone https://github.com/li1507/k3screenctrl_build.git package/lean/k3screenctrl/
echo '========= K3��Ļ������� ������ɣ� ========='

# echo '���OpenClash'
# rm -rf package/lean/luci-app-openclash
# mkdir package/luci-app-openclash
# cd package/luci-app-openclash
# git init
# git remote add -f origin https://github.com/vernesong/OpenClash.git
# git config core.sparsecheckout true
# echo "luci-app-openclash" >> .git/info/sparse-checkout
# git pull --depth 1 origin master
# git branch --set-upstream-to=origin/master master
# echo '========= OpenClash ������ɣ� ========='

# echo '���Haiibo���Դ'
# sed -i '1i src-git haiibo https://github.com/haiibo/openwrt-packages' feeds.conf.default
# echo '========= Haiibo���Դ ������ɣ� ========='

# echo '���kenzok8 openwrt-package'
# sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
# echo '========= kenzok8���Դ ������ɣ� ========='

# echo '���kenzok8 small-package'
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# echo '========= kenzok8���Դ ������ɣ� ========='

# echo '���MosDNS'
# rm -rf feeds/packages/net/v2ray-geodata
# rm -rf feeds/haiibo/luci-app-mosdns
# rm -rf feeds/haiibo/mosdns
# rm -rf package/feeds/haiibo/luci-app-mosdns
# rm -rf package/feeds/haiibo/mosdns
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# echo '========= MosDNS ������ɣ� ========='

echo '�Ƴ�bcm53xx�е���������'
sed -i '421,453d' target/linux/bcm53xx/image/Makefile
sed -i '140,412d' target/linux/bcm53xx/image/Makefile
sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
echo '========= �Ƴ�bcm53xx�е�����������ɣ� ========='

# 1.'asus_dhd24' 2.'ac88u_20' 3.'69027'
firmware='69027'
echo '�滻��������'
wget -nv https://github.com/li1507/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '========= �滻���������滻��ɣ� ========='