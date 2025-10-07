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
<<<<<<< HEAD
read -p "Enter choice (1-3): " CHOICEanalyze_log() {
=======
read -p "Enter choice (1-3): " CHOICE

# Function to analyze logs
analyze_log() {
>>>>>>> 4815764d506e2d96a3210e20f766a62aa700a026
    local LOG_FILE=$1
    local LOG_NAME=$2

    if [ ! -f "$LOG_FILE" ]; then
        echo "❌ Error: Log file $LOG_FILE not found!"
        exit 1
    fi

    echo "Analyzing $LOG_NAME log..."

    # Count occurrences per device
    echo "----------------------------------------------------" >> "$REPORT_FILE"
    echo "📅 Report generated on: $(date)" >> "$REPORT_FILE"
    echo "📘 Log analyzed: $LOG_NAME" >> "$REPORT_FILE"
    echo "----------------------------------------------------" >> "$REPORT_FILE"

    awk '{print $2}' "$LOG_FILE" | sort | uniq -c | awk '{print "Device:", $2, "| Entries:", $1}' >> "$REPORT_FILE"

    # Bonus: record first and last timestamps
    FIRST_TS=$(head -1 "$LOG_FILE" | awk '{print $1}')
    LAST_TS=$(tail -1 "$LOG_FILE" | awk '{print $1}')
    echo "⏱ First Entry: $FIRST_TS" >> "$REPORT_FILE"
    echo "⏱ Last Entry: $LAST_TS" >> "$REPORT_FILE"
    echo "----------------------------------------------------" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    echo "✅ Analysis complete! Report saved to $REPORT_FILE"
}

<<<<<<< HEAD
# Handle menu selection
case $CHOICE in
    1)
        analyze_log "$ACTIVE_DIR/heart_rate.log" "Heart Rate"
        ;;
    2)
        analyze_log "$ACTIVE_DIR/temperature.log" "Temperature"
        ;;
    3)
        analyze_log "$ACTIVE_DIR/water_usage.log" "Water Usage"
        ;;
    *)
        echo "❌ Invalid choice! Please enter 1, 2, or 3."
        exit 1
        ;;
esac
=======
>>>>>>> 4815764d506e2d96a3210e20f766a62aa700a026
