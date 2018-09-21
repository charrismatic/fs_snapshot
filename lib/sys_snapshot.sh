#!/bin/bash

# Whole system snapshot

find / -printf "%Cy.%Cm.%Cd %CH:%CM %M %p %b %l \n" > ~/.system_snapshot


