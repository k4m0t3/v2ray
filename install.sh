#!/bin/sh
BB="/online/atong/v2ray/bin/busybox"
FIND=`cat /system/etc/autorun.sh | grep 'sh /online/atong/v2ray/bin/run.sh'`
if [[ -z "$FIND" ]]; then
mount -o remount,rw /system /system
echo "sh /online/atong/v2ray/bin/run.sh" >> /system/etc/autorun.sh
#echo -e "/online/atong/v2ray/bin/busybox httpd -p 8182 -h /online/atong/v2ray/web/" >> /system/etc/autorun.sh
else
sleep 1
fi
cat /system/etc/autorun.sh | grep "/online/atong/v2ray/bin/busybox httpd -p 8182 -h /online/atong/v2ray/web/" > /dev/null 2>&1
if [ "$?" -eq 0 ];then
$BB sed -i 's|/online/atong/v2ray/bin/busybox httpd -p 8182 -h /online/atong/v2ray/web/||' /system/etc/autorun.sh
fi
chmod -R 777 /online/atong/v2ray
echo Installation Completed
sleep 1
echo Rebooting Device
sleep 1
atc AT^RESET > /dev/null 2>&1
exit