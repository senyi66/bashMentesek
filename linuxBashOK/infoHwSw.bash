#!/bin/bash
#
# Keszitette: Sényi Zsolt - senyi.eu
# 2020
#
# version 2.0.0
#
# pause 'Nyomjon [Enter] -t a folytatashoz...'
clear
MYPWD=$(pwd)
LOG_DIR="$(pwd)/log/$(date +%Y)-$HOSTNAME"
# LOG_DIR=$(pwd)
LOG_NAME="hwInfo-$HOSTNAME.txt"
### LOG_NAME="$HOSTNAME-"`basename $0`".txt"
# ez igy nem mukodik a crontab root user esetén miven neki a pwd-je más
source $MYPWD/00-functions.lib
# itt kezdodnek az ellenorzesek log, konyvtar ...
# ekkor kezdodott a script
### log-info-write E `basename $0`" kezdes" $LOG_DIR $LOG_NAME
log-info-write E " kezdes" $LOG_DIR $LOG_NAME
# pkill 'rsync -ahr'
directory-check 0 "$LOG_DIR"

log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "SambaTestPArm adatai" $LOG_DIR $LOG_NAME
testparm >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "Windows felhasznalok" $LOG_DIR $LOG_NAME
pdbedit -Lv >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "Linux felhasznalok" $LOG_DIR $LOG_NAME
cat /etc/passwd >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "Linux csoportok" $LOG_DIR $LOG_NAME
cat /etc/group >> $LOG_DIR/$LOG_NAME

log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME


log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "Linux crontab" $LOG_DIR $LOG_NAME
cat /etc/crontab >> $LOG_DIR/$LOG_NAME

log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME


log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "SMARTCTL adatai" $LOG_DIR $LOG_NAME

smartctl -a /dev/nvme0n1p1 >> $LOG_DIR/$LOG_NAME
smartctl -a /dev/sda >> $LOG_DIR/$LOG_NAME
smartctl -a /dev/sdb >> $LOG_DIR/$LOG_NAME
smartctl -a /dev/sdc >> $LOG_DIR/$LOG_NAME
smartctl -a /dev/sdd >> $LOG_DIR/$LOG_NAME
smartctl -a /dev/sde >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "APC adatai" $LOG_DIR $LOG_NAME
apcaccess >> $LOG_DIR/$LOG_NAME

log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "HWINFO adatai" $LOG_DIR $LOG_NAME
hwinfo >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
hwinfo --short >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "LSCPU adatai" $LOG_DIR $LOG_NAME
lscpu >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "LSHW adatai" $LOG_DIR $LOG_NAME
lshw >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
lshw -short >> $LOG_DIR/$LOG_NAME
lshw >> $LOG_DIR/$LOG_NAME
lshw -html > $LOG_DIR/$LOG_NAME.html
lshw -xml > $LOG_DIR/$LOG_NAME.xml

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "LSPCI adatai" $LOG_DIR $LOG_NAME
lspci >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
lspci -v >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "LSUSB adatai" $LOG_DIR $LOG_NAME
lsusb >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "LSSCSI adatai" $LOG_DIR $LOG_NAME
lsscsi >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "LSBLK adatai" $LOG_DIR $LOG_NAME
lsblk >> $LOG_DIR/$LOG_NAME


log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "inxi -Fx adatai" $LOG_DIR $LOG_NAME
inxi -Fx >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "DF adatai" $LOG_DIR $LOG_NAME
df -H >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "pydf adatai" $LOG_DIR $LOG_NAME
pydf >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "fdisk adatai" $LOG_DIR $LOG_NAME
fdisk -l >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "MOUNT adatai" $LOG_DIR $LOG_NAME
mount | column -t >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
mount | column -t | grep ext >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "dmidecode adatai" $LOG_DIR $LOG_NAME
dmidecode >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "cat /proc/ infók adatai" $LOG_DIR $LOG_NAME
cat /proc/cpuinfo >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
cat /proc/meminfo >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
cat /proc/versio >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
cat /proc/scsi/scsi >> $LOG_DIR/$LOG_NAME
log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
cat /proc/partitions >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "hdparm adatai" $LOG_DIR $LOG_NAME
hdparm -i /dev/sda1 >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "HDPARM adatai" $LOG_DIR $LOG_NAME
hdparm -I /dev/nvme0n1p1 >> $LOG_DIR/$LOG_NAME
hdparm -I /dev/sda /dev/sda >> $LOG_DIR/$LOG_NAME
hdparm -I /dev/sda /dev/sdb >> $LOG_DIR/$LOG_NAME
hdparm -I /dev/sda /dev/sdc >> $LOG_DIR/$LOG_NAME
hdparm -I /dev/sda /dev/sdd >> $LOG_DIR/$LOG_NAME
hdparm -I /dev/sda /dev/sde >> $LOG_DIR/$LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME

log-info-write 0 "Network info" $LOG_DIR $LOG_NAME
ip a >> $LOG_DIR/$LOG_NAME

log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "Notebook akkumulátor adatai 01" $LOG_DIR $LOG_NAME
upower -i /org/freedesktop/UPower/devices/battery_BAT0 >> $LOG_DIR/$LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "Notebook akkumulátor adatai 02" $LOG_DIR $LOG_NAME
upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"  >> $LOG_DIR $LOG_NAME

# log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
# log-info-write 0 "Notebook akkumulátor adatai 03" $LOG_DIR $LOG_NAME
# apt-get install apci
# watch --interval=5 acpi -V >> $LOG_DIR $LOG_NAME

log-info-write 0 "**********************************************" $LOG_DIR $LOG_NAME
log-info-write 0 "BASH adatai" $LOG_DIR $LOG_NAME
log-info-write 0 "BASH Info: $BASH ---" $LOG_DIR $LOG_NAME
log-info-write 0 "BASH_ENV Info: $BASH_ENV ---" $LOG_DIR $LOG_NAME
log-info-write 0 "BASH_VERSION Info: $BASH_VERSION ---" $LOG_DIR $LOG_NAME
log-info-write 0 "BASH_VERSINFO Info: $BASH_VERSINFO ---" $LOG_DIR $LOG_NAME
log-info-write 0 "COLUMNS Info: $COLUMNS ---" $LOG_DIR $LOG_NAME
log-info-write 0 "COMP_CWORD Info: $COMP_CWORD ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "COMP_LINE Info: $COMP_LINE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "COMP_POINT Info: $COMP_POINT ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "COMP_WORDS Info: $COMP_WORDS ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "COMPREPLY Info: $COMPREPLY ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "DIRSTACK Info: $DIRSTACK ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "EUID Info: $EUID ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "FCEDIT Info: $FCEDIT ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "FIGNORE Info: $FIGNORE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "FUNCNAME Info: $FUNCNAME ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "GLOBIGNORE Info: $GLOBIGNORE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "GROUPS Info: $GROUPS ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HISTCMD Info: $HISTCMD ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HISTCONTROL Info: $HISTCONTROL ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HISTFILE Info: $HISTFILE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HISTFILESIZE Info: $HISTFILESIZE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HISTIGNORE Info: $HISTIGNORE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HISTSIZE Info: $HISTSIZE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HOSTFILE Info: $HOSTFILE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HOSTNAME Info: $HOSTNAME ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "HOSTTYPE Info: $HOSTTYPE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "IGNOREEOF Info: $IGNOREEOF ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "INPUTRC Info: $INPUTRC ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LANG Info: $LANG ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LC_ALL Info: $LC_ALL ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LC_COLLATE Info: $LC_COLLATE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LC_CTYPE Info: $LC_CTYPE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LC_MESSAGES Info: $LC_MESSAGES ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LC_NUMERIC Info: $LC_NUMERIC ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LINENO Info: $LINENO ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "LINES Info: $LINES ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "MACHTYPE Info: $MACHTYPE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "MAILCHECK Info: $MAILCHECK ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "OLDPWD Info: $OLDPWD ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "OPTERR Info: $OPTERR ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "OSTYPE Info: $OSTYPE ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "PIPESTATUS Info: $PIPESTATUS ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "POSIXLY_CORRECT Info: $POSIXLY_CORRECT ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "PPID Info: $PPID ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "PROMPT_COMMAND Info: $PROMPT_COMMAND ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "PS3 Info: $PS3 ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "PS4 Info: $PS4 ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "PWD Info: $PWD ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "RANDOM Info: $RANDOM ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "REPLY Info: $REPLY ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "SECONDS Info: $SECONDS ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "SHELLOPTS Info: $SHELLOPTS ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "SHLVL Info: $SHLVL ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "TIMEFORMAT Info: $TIMEFORMAT ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "TMOUT Info: $TMOUT ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "UID Info: $UID ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$* Info: $* ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$@ Info: $@ ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$# Info: $# ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$? Info: $? ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$- Info: $- ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$\$ Info: $$ ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$! Info: $! ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$0 Info: $0 ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$1 Info: $1 ---"  $LOG_DIR $LOG_NAME
log-info-write 0 "\$_ Info: $_ ---"  $LOG_DIR $LOG_NAME

log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME
log-info-write 0 "______________________________________________" $LOG_DIR $LOG_NAME

log-info-write 0 `basename $0`" vege" $LOG_DIR $LOG_NAME

exit 0

