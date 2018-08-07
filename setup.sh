#!/bin/bash

#  ${PWD}
#  SCRIPT_PATH=$(pwd)
SCRIPT_PATH=`realpath $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`

# if exist? 
# find $SCRIPT_PATH -name "_snapshot* -del 

echo "$SCRIPT_DIR/lib/fs_snapshot.sh  ->  ~/bin/fs_snapshot"
ln -s  $SCRIPT_DIR/lib/fs_snapshot.sh ~/bin/fs_snapshot

echo "$SCRIPT_DIR/lib/rt_snapshot.sh  ->  ~/bin/rt_snapshot"
ln -s  $SCRIPT_DIR/lib/rt_snapshot.sh ~/bin/rt_snapshot

echo "$SCRIPT_DIR/lib/sys_snapshot.sh  ->  ~/bin/sys_snapshot"
ln -s  $SCRIPT_DIR/lib/sys_snapshot.sh ~/bin/sys_snapshot

# also add to startup
echo "$SCRIPT_DIR/lib/sys_snapshot.sh  ->  ~/bin/sc_snapshot"
ln -s  $SCRIPT_DIR/lib/sys_snapshot.sh ~/bin/sc_snapshot

unset SCRIPT_PATH
unset SCRIPT_DIR
