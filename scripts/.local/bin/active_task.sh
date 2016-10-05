#!/usr/bin/env bash

task active 2> /dev/null | sed -n '4p' | awk '{print $1, substr($0, index($0, $6))}'
