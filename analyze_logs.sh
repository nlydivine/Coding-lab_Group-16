#!/bin/bash
# ===========================================
# Hospital Log Analysis Script
# ===========================================

# Directories
ACTIVE_DIR="hospital_data/active_logs"
REPORTS_DIR="hospital_data/reports"
REPORT_FILE="$REPORTS_DIR/analysis_report.txt"

# Ensure report directory exists
mkdir -p "$REPORTS_DIR"

# Display menu
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " CHOICE
