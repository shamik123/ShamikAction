#!/bin/sh -l

echo "Hello $1"
output=$1
"$output" >> $GITHUB_OUTPUT



