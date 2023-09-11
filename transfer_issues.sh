#!/bin/bash
DEST_USER="MSD-LIVE"
DEST_REPO="issues"

# Create a list of issue numbers in the source repository
issue_numbers=$(gh issue list -s all -L 500 --json number | jq -r '.[] | .number')
for i in $issue_numbers
do
   echo ${i}
   gh issue transfer ${i} https://github.com/${DEST_USER}/${DEST_REPO}
done
