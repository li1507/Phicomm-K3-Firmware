#!/bin/bash
echo '修改 IP'
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='Router'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=

echo '修改upnp绑定文件位置'
sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file
