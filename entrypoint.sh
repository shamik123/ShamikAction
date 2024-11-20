#!/bin/sh -l

echo "Hello $1"
$1 >> output
echo$output
$output >> $GITHUB_OUTPUT



