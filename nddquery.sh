#!/usr/bin/ksh
#
# This one line script do a full query on all ndd parameters.
# Usage  : nddquery.sh <module> ...
# Example: nddquery.sh ip tcp udp icmp arp hme qfe
# 
# Copyright (c) 2002 by Antoni Sawicki <tenox@tenox.tc>
#

[ "$#" -gt "0" ] && for m in $@; do echo "/dev/$m:"; ndd "/dev/$m" \? | tr "(" " " | while read n; do set -- $n; [ "$1" != "?" ] && echo " $1 : $(ndd /dev/$m $1)"; done; done 
