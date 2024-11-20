#!/bin/sh -l

# Get the command from input arguments
command="$1"

# Execute the command and capture the output
output=$(sh -c "$command" 2>&1)

# Log the output
echo "Command output:"
echo "$output"

# Remove any invalid characters or line breaks
sanitized_output=$(echo "$output" | tr -d '\r\n' | tr ':' '_' | tr -d '"')

# Validate that the sanitized output is not empty
if [ -z "$sanitized_output" ]; then
  echo "Error: Sanitized output is empty."
  exit 1
fi

# Write the sanitized output to GITHUB_ENV
echo "output=$sanitized_output" >> $GITHUB_ENV || {
  echo "Failed to write to GITHUB_ENV"
  exit 1
}

# Write the sanitized output to GITHUB_OUTPUT
echo "message=$sanitized_output" >> $GITHUB_OUTPUT || {
  echo "Failed to write to GITHUB_OUTPUT"
  exit 1
}
