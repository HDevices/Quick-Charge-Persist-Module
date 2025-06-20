#!/system/bin/sh

# Registro para logs (opcional)
log_file="/data/adb/modules/quickcharge_persist/quickcharge.log"

echo "[QuickCharge] Ejecutando post-fs-data..." > $log_file
echo "[QuickCharge] Estableciendo propiedad persist.vendor.quick.charge=1" >> $log_file

resetprop persist.vendor.quick.charge 1

echo "[QuickCharge] Verificación: $(getprop persist.vendor.quick.charge)" >> $log_file
