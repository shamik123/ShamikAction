#!/bin/sh -l

# Get the command from input arguments
command="$1"

# Execute the command and capture the output
output=$(sh -c "$command")

# Log the output
echo "Command output:"
echo "$output"

# Save output to a file
echo "$output" >> output

# Sanitize the output to remove or replace invalid characters
sanitized_output=$(echo "$output" | tr ':' '_')

# Set the sanitized output as an environment variable for future steps
echo "output=$sanitized_output" >> $GITHUB_ENV

# Set the output for this step using GITHUB_OUTPUT
echo "message=$sanitized_output" >> $GITHUB_OUTPUT
