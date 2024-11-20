#!/bin/sh -l

echo "Hello $1"
$1 >> output
"$output" >> $GITHUB_OUTPUT



