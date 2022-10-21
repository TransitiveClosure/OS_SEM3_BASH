#!/bin/bash

mkfifo pipe
sh files5/handler.sh&
sh files5/generator.sh
rm pipe