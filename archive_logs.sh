#!/bin/bash

# Hospital Log Archival Script


# Define directories
ACTIVE_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archive_logs"

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
    local BASE_NAME=$2

    # Check if source log exists
    if [ ! -f "$SRC_FILE" ]; then
        echo "Error: $SRC_FILE not found!"
        exit 1
    fi

    # Ensure destination directory exists
    if [ ! -d "$ARCHIVE_DIR" ]; then
        echo "Creating archive directory at $DEST_DIR..."
        mkdir -p "$ARCHIVE_DIR" || { echo "Failed to create directory!"; exit 1; }
    fi

    # Move and rename with timestamp
    local ARCHIVE_NAME="${BASE_NAME}_${TIMESTAMP}.log"
    echo "Archiving $(basename "$SRC_FILE")..."
    mv "$SRC_FILE" "$ARCHIVE_DIR/$ARCHIVE_NAME" || { echo "Failed to move file!"; exit 1; }

    # Create a new empty log for continued monitoring
    touch "$SRC_FILE"

    echo "Successfully archived to $ARCHIVE_DIR/$ARCHIVE_NAME"
}

#Handle user choice
case $CHOICE in
    1)
        archive_log "$ACTIVE_DIR/heart_rate.log" "heart_rate"
        ;;
    2)
        archive_log "$ACTIVE_DIR/temperature.log" "temperature"
        ;;
    3)
        archive_log "$ACTIVE_DIR/water_usage.log" "water_usage"
        ;;
    *)
        echo " Invalid input! Please enter 1, 2, or 3."
        exit 1
        ;;
esac
