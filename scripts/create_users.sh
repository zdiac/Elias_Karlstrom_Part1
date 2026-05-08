#!/bin/bash

# Path to the CSV file
CSV_FILE="$HOME/users.csv"

# Check that the CSV file exists before proceeding
if [ ! -f "$CSV_FILE" ]; then
    echo "ERROR: CSV file not found at $CSV_FILE"
    exit 1
fi

# Skip the header row and process each line
tail -n +2 "$CSV_FILE" | while IFS=',' read -r \
    first last username dept adgroup idmgroup; do

    # Check if the user already exists in IdM
    if ipa user-find --login="$username" &>/dev/null; then
        echo "SKIPPED: $username already exists"
        continue
    fi

    # Create the IdM user account
    ipa user-add "$username" \
        --first="$first" \
        --last="$last" \
        --password <<< "Password123"

    # Add the user to the correct IdM group
    ipa group-add-member "$idmgroup" --users="$username"

    # Confirm that the account was created
    echo "CREATED: $username added to group $idmgroup"

done
