#!/bin/bash
echo '修改 IP'
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

echo '修改主机名'
sed -i "s/hostname='LEDE'/hostname='Router'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
