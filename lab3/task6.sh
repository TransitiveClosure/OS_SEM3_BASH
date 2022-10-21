#!/bin/bash

sh files6/handler.sh&
pid=$!
sh files6/generator.sh $pid