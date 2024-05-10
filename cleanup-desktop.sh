#!/bin/bash

# Remember to run "chmod +x cleanup-desktop.sh"

# Define the base directory
BASE_DIR=~/Desktop

# Define the archive directory
ARCHIVE_DIR=${BASE_DIR}/Archive

# Get the current date
CURRENT_DATE=$(date +"%m-%d-%Y")

# Get the current month and year
CURRENT_MONTH_YEAR=$(date +"%B-%Y")

# Create the Archive directory if it doesn't exist
if [ ! -d "${ARCHIVE_DIR}" ]; then
    mkdir "${ARCHIVE_DIR}"
fi

# Create the month-year directory if it doesn't exist
if [ ! -d "${ARCHIVE_DIR}/${CURRENT_MONTH_YEAR}" ]; then
    mkdir "${ARCHIVE_DIR}/${CURRENT_MONTH_YEAR}"
fi

# Create the date directory if it doesn't exist
if [ ! -d "${ARCHIVE_DIR}/${CURRENT_MONTH_YEAR}/${CURRENT_DATE}" ]; then
    mkdir "${ARCHIVE_DIR}/${CURRENT_MONTH_YEAR}/${CURRENT_DATE}"
fi

# Move all files and directories from the Desktop to the date directory
find ${BASE_DIR} -maxdepth 1 -mindepth 1 -not -name 'Archive' -exec mv {} "${ARCHIVE_DIR}/${CURRENT_MONTH_YEAR}/${CURRENT_DATE}" \;
