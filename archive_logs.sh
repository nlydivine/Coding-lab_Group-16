#!/bin/bash

# Hospital Log Archival Script


# Define directories
ACTIVE_DIR="hospital_data/active_logs"
HEART_ARCHIVE="hospital_data/heart_data_archive"
TEMP_ARCHIVE="hospital_data/temp_data_archive"
WATER_ARCHIVE="hospital_data/water_data_archive"

# Get timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Display menu
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " CHOICE

     
# Archive function
archive_log() {
    local SRC_FILE=$1
    local DEST_DIR=$2
    local BASE_NAME=$3

    # Check if source log exists
    if [ ! -f "$SRC_FILE" ]; then
        echo "Error: $SRC_FILE not found!"
        exit 1
    fi

    # Ensure destination directory exists
    if [ ! -d "$DEST_DIR" ]; then
        echo "Creating archive directory at $DEST_DIR..."
        mkdir -p "$DEST_DIR" || { echo "Failed to create directory!"; exit 1; }
    fi

    # Move and rename with timestamp
    local ARCHIVE_NAME="${BASE_NAME}_${TIMESTAMP}.log"
    echo "Archiving $(basename "$SRC_FILE")..."
    mv "$SRC_FILE" "$DEST_DIR/$ARCHIVE_NAME" || { echo "Failed to move file!"; exit 1; }

    # Create a new empty log for continued monitoring
    touch "$SRC_FILE"

    echo "Successfully archived to $DEST_DIR/$ARCHIVE_NAME"
}

#Handle user choice
case $CHOICE in
    1)
        archive_log "$ACTIVE_DIR/heart_rate.log" "$HEART_ARCHIVE" "heart_rate"
        ;;
    2)
        archive_log "$ACTIVE_DIR/temperature.log" "$TEMP_ARCHIVE" "temperature"
        ;;
    3)
        archive_log "$ACTIVE_DIR/water_usage.log" "$WATER_ARCHIVE" "water_usage"
        ;;
    *)
        echo " Invalid input! Please enter 1, 2, or 3."
        exit 1
        ;;
esac
