#!/bin/bash
## INCLUDE OPTIONS FOR 
## - "THIS DIRECTORY" VS GLOBAL  
## - VIEW OUTPUT IN LESS OR SAVE TO FILE 
## - FILTER OUTPUT 
## - MODIFY PARAMETER LIST 

TSTAMP=$(date +'%Y%m%d%H%M')
SNAPFILE=rt_snapshot_$TSTAMP
SNAPPATH=~/.snapshot/
SNAPFILEPATH=$SNAPPATH/$SNAPFILE
SC_OPTS="--no-pager --full --all --show-types --no-legend --plain"
SEPERATOR=#------------------------------------------------------------------------------

# DUMPS A LIST OF ALL RUNNING SYSTEMD UNITS AT STARTUP
# DIFF OVER TIME TO IDENTIFY PROBLEMS AND GROWING PROCESSS LIST
# no pager
# dont shorten names
# show types explicit 
# no legend
# dont show inactive or disabled units
# remove leading and trailing whitespace
# remove color output
# | grep -v dead | grep -v inactive 

systemctl list-units $SC_OPTS | sed 's/^[ \t]*//;s/[ \t]*$//' | sort > $SNAPFILEPATH

systemctl list-unit-files | sed 's/^[ \t]*//;s/[ \t]*$//' | sort  >> $SNAPFILEPATH

echo "Runtime snapshot completed: $TSTAMP"

# PROFILING TO DIFFERENT FUNCTION
# systemd-analyze blame --no-pager | sed 's/^[ \t]*//;s/[ \t]*$//' > ~/.snapshot/rt_proflile_snapshot_$TSTAMP
# systemctl list-dependencies  --no-pager --full | grep -v slice | grep -v mount | cut --characters=5-
# systemd-cgls --unit --no-pager --full | sed 's/slice/\n/g' | sed 's/^[ \t]*//;s/[├]//' | sed 's/\│[ ]+/\t/g' | sed 's/[\└]/ /g' | sed 's/[\─]*//g'

# sys
echo -e "\n\n\nLIST sys" > $SNAPFILEPATH.sys
echo $SEPERATOR >> $SNAPFILEPATH.sys
cat $SNAPFILEPATH | grep sys  | sort >> $SNAPFILEPATH.sys

# MOUNT
echo -e "\n\n\nLIST MOUNT" >> $SNAPFILEPATH.mounts
echo $SEPERATOR | sort > $SNAPFILEPATH.mounts

# snap
echo -e "\n\n\nLIST SNAP" > $SNAPFILEPATH.snap
echo $SEPERATOR >> $SNAPFILEPATH.snap
cat $SNAPFILEPATH | grep snap  | sort >>. $SNAPFILEPATH.snap

# docker 
echo -e "\n\n\nLIST docker" > $SNAPFILEPATH.docker
echo $SEPERATOR  >> $SNAPFILEPATH.docker >> $SNAPFILEPATH.docker
cat $SNAPFILEPATH | grep docker  | sort  >> $SNAPFILEPATH.docker

## device 
echo -e "\n\n\nLIST DEVICES" > $SNAPFILEPATH.devices 
echo $SEPERATOR >> $SNAPFILEPATH.devices 
cat $SNAPFILEPATH | grep device | sed 's/.device//g' | sed 's/\s\s\s*/;/g'  >> $SNAPFILEPATH.devices


## TIMERS 
echo -e "\n\n\nLIST TIMERS"  > $SNAPFILEPATH.timers
echo $SEPERATOR  >> $SNAPFILEPATH.timers
cat $SNAPFILEPATH | grep timer  | sort  >> $SNAPFILEPATH.timers

#echo -e "LIST TIMER FILES"
echo -e "\n\n\nTIMER DETAILS"  >> $SNAPFILEPATH.timers
echo $SEPERATOR  >> $SNAPFILEPATH.timers
systemctl list-timers --full --all --no-legend  >> $SNAPFILEPATH.timers


# SOCKETS
echo -e "\n\n\nLIST SOCKETS" > $SNAPFILEPATH.sockets
echo $SEPERATOR >> $SNAPFILEPATH.sockets
cat $SNAPFILEPATH | grep socket | sed 's/^[ \t]*//;s/[ \t]*$//'  | sed 's/.service//g' | sed 's/.socket//g' | sed 's/\s\s\s*/;/g' | sort  >> $SNAPFILEPATH.sockets 

echo -e "\n\nSOCKET DETAILS" >> $SNAPFILEPATH.sockets
echo $SEPERATOR >> $SNAPFILEPATH.sockets
systemctl list-sockets --full --all --no-legend | sed 's/^[ \t]*//;s/[ \t]*$//' | | sed 's/.service//g' | sed 's/.socket//g' | sed 's/\s\s\s*/;/g' sort  >> $SNAPFILEPATH.sockets

#cat  ~/.snapshot/rt_snapshot_201808070147 | grep "service" | sort | sed 's/\s*\s/, /g' 
#cat  ~/.snapshot/rt_snapshot_201808070147 | grep "target" | sort | sed 's/\s*\s/, /g' 
#cat  ~/.snapshot/rt_snapshot_201808070147 | grep "slice" | sort | sed 's/\s*\s/, /g' 
# cat $SNAPFILEPATH.* | less

