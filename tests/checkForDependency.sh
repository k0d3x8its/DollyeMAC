#!/bin/bash

# Load the function to test
source "$(dirname "$0")/../dollyemac.sh"

# Function to test checkForDependency
echo "Running test: checkForDependency"

# Check if macchanger is not installed and simulate user response "y"
if ! which macchanger > /dev/null 2>&1; then
    # Simulate a "yes" response
    echo "y" | checkForDependency

    #Assert that macchanger is installed
    if which macchanger > /dev/null 2>&1; then
        echo "checkForDependency passed"
    else 
        echo "checkForDependency failed"
        exit 1
    fi
else
    echo "macchanger is already installed. Skipping installation test"
fi