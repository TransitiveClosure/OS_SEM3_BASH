#!/bin/bash

awk '$3=="(WW)"{ {$3 = "Warning"} print}' /var/log/anaconda/X.log > full.log
awk '$3=="(II)"{ {$3 = "Information"} print}' /var/log/anaconda/X.log >> full.log
less full.log
