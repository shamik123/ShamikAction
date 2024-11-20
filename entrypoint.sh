#!/bin/sh -l

# The argument passed to the script is a CLI command to be executed
command="$1"

# Execute the command and capture its output in the variable 'output'
output=$(sh -c "$command")

# Echo the result to the log
echo "Command output:"
echo "$output"

# Save the output to a file
echo "$output" >> output

# Set the output for GitHub Actions
echo "output=$output" >> $GITHUB_ENV
echo "::set-output name=message::$output"

