#!/bin/bash

# file snapshot (local directory)

find ./ -printf "%Cy.%Cm.%Cd %CH:%CM %M %p %b %l \n" > .fs_snapshot

