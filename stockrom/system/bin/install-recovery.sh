#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11943936 b51a786a23a0ca833c940f893a1b989d9d1dd106 9531392 fea4389afb1069631fcd17368821ef687e6929d9
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11943936:b51a786a23a0ca833c940f893a1b989d9d1dd106; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:9531392:fea4389afb1069631fcd17368821ef687e6929d9 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery b51a786a23a0ca833c940f893a1b989d9d1dd106 11943936 fea4389afb1069631fcd17368821ef687e6929d9:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
