#!/bin/sh
echo "Downloading Files..."
wget https://github.com/k4m0t3/v2ray/raw/main/atong.tgz -O atong.tgz
adb kill-server >nul 2>&1
echo "Connecting to your modem ...."
adb connect 192.168.8.1:5555 >nul 2>&1
adb devices -l | find "192.168.8.1:5555" >nul 2>&1
if [ "$?" -eq 1 ]; then
adb kill-server >null 2>&1
echo Device NOT Connected !!!
echo Exiting ...
timeout /t 10 /nobreak >null 2>&1
else
echo Connected !!!
adb shell sleep 2
adb shell echo Installing
adb shell mount -o remount,rw /system
adb shell echo Pakihintay matapos, wag mainip
adb push atong.tgz /tmp/
adb shell rm -rf /online/atong/v2ray
adb shell tar -xzvf /tmp/atong.tgz -C /online
adb shell chmod -R 777 /online/atong/v2ray/
adb shell rm -rf /tmp/atong.tgz
adb shell sh /online/atong/v2ray/bin/install.sh
adb shell echo "Install Completed."
adb shell echo "Rebooting Device..."
adb kill-server >nul 2>&1
pause >nul 2>&1