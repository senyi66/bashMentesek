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
LOG_DIR="$(pwd)/../log/$(date +%Y)-$HOSTNAME"
# LOG_DIR=$(pwd)
LOG_NAME="infoIP-$HOSTNAME.txt"
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

log-info-write 0 "Network info" $LOG_DIR $LOG_NAME
ip a >> $LOG_DIR/$LOG_NAME
# ip address >> $LOG_DIR/$LOG_NAME
log-info-write 0 "ip add show info" $LOG_DIR $LOG_NAME
ip add show >> $LOG_DIR/$LOG_NAME
ip addrlabel >> $LOG_DIR/$LOG_NAME
# ip route >> $LOG_DIR/$LOG_NAME
log-info-write 0 "ip route show info" $LOG_DIR $LOG_NAME
ip route show >> $LOG_DIR/$LOG_NAME
ip rule >> $LOG_DIR/$LOG_NAME
ip neigh >> $LOG_DIR/$LOG_NAME
ip ntable >> $LOG_DIR/$LOG_NAME
ip tunnel >> $LOG_DIR/$LOG_NAME
ip tuntap >> $LOG_DIR/$LOG_NAME
ip maddress >> $LOG_DIR/$LOG_NAME
ip mroute >> $LOG_DIR/$LOG_NAME
ip mrule >> $LOG_DIR/$LOG_NAME
# ip monitor >> $LOG_DIR/$LOG_NAME
# ip xfrm monitor>> $LOG_DIR/$LOG_NAME
ip netns >> $LOG_DIR/$LOG_NAME
# ip l2tp >> $LOG_DIR/$LOG_NAME
# ip fou >> $LOG_DIR/$LOG_NAME
# ip macsec >> $LOG_DIR/$LOG_NAME
ip tcp_metrics >> $LOG_DIR/$LOG_NAME
ip token >> $LOG_DIR/$LOG_NAME
ip netconf >> $LOG_DIR/$LOG_NAME
# ip ila >> $LOG_DIR/$LOG_NAME
ip vrf >> $LOG_DIR/$LOG_NAME
# ip sr >> $LOG_DIR/$LOG_NAME
ip nexthop >> $LOG_DIR/$LOG_NAME


log-info-write 0 "Network info" $LOG_DIR $LOG_NAME
ifconfig >> $LOG_DIR/$LOG_NAME

log-info-write 0 "Firewall info" $LOG_DIR $LOG_NAME
ufw status >> $LOG_DIR/$LOG_NAME
ufw status verbose >> $LOG_DIR/$LOG_NAME
ufw status numbered >> $LOG_DIR/$LOG_NAME


log-info-write 0 `basename $0`" vege" $LOG_DIR $LOG_NAME

exit 0

