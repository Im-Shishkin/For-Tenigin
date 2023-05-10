#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
NC='\033[0m'

# Prompt user to enter input file name
echo -e "${GREEN}Enter the name of the input file:${NC} "
read filename

# Check if file exists
while [ ! -f "$filename" ]; do
    echo -e "${GREEN}The file doesn't exist. Please try again:${NC} "
    read filename
done

# Prompt user to enter encryption key
echo -e "${GREEN}Enter the encryption key:${NC} "
read key

# Read input text from file
input=$(cat "$filename")

# Encrypt the input text using the substitution cipher
output=$(echo "$input" | tr '[:lower:]' "$key")

# Save encrypted text to output file
echo "$output" > output.txt

# Display message indicating that encryption is complete
echo -e "${GREEN}Encryption complete. Encrypted text saved to output.txt.${NC}"

# Prompt user to open output file
echo -e "${GREEN}Do you want to open the output file? (y/n):${NC} "
read choice

if [ "$choice" == "y" ]; then
    start output.txt
fi
