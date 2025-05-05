#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Create the docs directory if it doesn't exist
mkdir -p ./docs

# Copy README.md into the docs directory
cp README.md ./docs/
cp -r assets ./docs/
cp CONTRIBUTING.md ./docs/
cp LICENSE ./docs/

# Run the mkdocs server
mkdocs serve
