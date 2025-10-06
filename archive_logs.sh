#!/bin/bash
"# ================================
# Hospital Log Archival Script
# ================================

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

      
