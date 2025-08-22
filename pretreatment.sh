#!/bin/bash

echo '添加lwz322的K3屏幕插件'
rm -rf package/lean/luci-app-k3screenctrl
git clone https://github.com/li1507/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '========= K3屏幕插件 加载完成！ ========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf package/lean/k3screenctrl
git clone https://github.com/li1507/k3screenctrl_build.git package/lean/k3screenctrl/
echo '========= K3屏幕驱动插件 加载完成！ ========='

echo '添加kenzok8 small-package'
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
echo '========= kenzok8软件源 加载完成！ ========='

# echo '添加kenzok8 small-package'
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# echo '========= kenzok8软件源 加载完成！ ========='

# echo '移除bcm53xx中的其他机型'
# sed -i '421,453d' target/linux/bcm53xx/image/Makefile
# sed -i '140,412d' target/linux/bcm53xx/image/Makefile
# sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
# echo '========= 移除bcm53xx中的其他机型完成！ ========='

# 1.'asus_dhd24' 2.'ac88u_20' 3.'69027'
# firmware='69027'
# echo '替换无线驱动'
# wget -nv https://github.com/li1507/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
# echo '========= 替换无线驱动替换完成！ ========='
