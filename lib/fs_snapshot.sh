#!/bin/bash

# file snapshot (local directory) 

TSTAMP=$(date +'%Y%m%d%H%M')

find ./ -printf "%Cy.%Cm.%Cd %CH:%CM %M %p %b %l \n" > .fs_snapshot_$TSTAMP

