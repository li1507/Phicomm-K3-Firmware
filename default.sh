#!/bin/bash

echo '�޸� IP'
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

echo '�޸�������'
sed -i "s/hostname='OpenWrt'/hostname='Router'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=

echo '�Ƴ���ҳ�ܷ���Ϣ��ʾ'
sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm

echo '�Ƴ���ҳ��־��ӡ'
sed -i '/console.log(mainNodeName);/d' package/lean/luci-theme-argon/htdocs/luci-static/argon/js/script.js

echo '�޸�upnp���ļ�λ��'
sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file

echo '�����ҳ��CPU�¶���ʾ'
sed -i "/<tr><td width=\"33%\"><%:Load Average%>/a \ \t\t<tr><td width=\"33%\"><%:CPU Temperature%></td><td><%=luci.sys.exec(\"sed 's/../&./g' /sys/class/thermal/thermal_zone0/temp|cut -c1-4\")%></td></tr>" feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
cat feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm |grep Temperature