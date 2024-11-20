#!/bin/sh -l

# Echo a hello message using the first argument passed to the script
echo "Hello $1"

# Save the output to a file
echo $1 >> output

# Print the contents of the output file to the console
echo "Contents of output file:"
cat output

# Set the output for GitHub Actions
echo "output=$(cat output)" >> $GITHUB_ENV
echo "::set-output name=message::$(cat output)"
