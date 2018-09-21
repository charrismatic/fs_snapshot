#!/bin/bash

## INCLUDE OPTIONS FOR 
## - "THIS DIRECTORY" VS GLOBAL  
## - VIEW OUTPUT IN LESS OR SAVE TO FILE 
## - FILTER OUTPUT 
## - MODIFY PARAMETER LIST 


find ./ -printf "%Cy.%Cm.%Cd %CH:%CM %M %p %b %l \n" > .runtime_snapshot
