analyze_log() {
    local LOG_FILE=$1
    local LOG_NAME=$2

     if [ ! -f "$LOG_FILE" ]; then
        echo "❌ Error: Log file $LOG_FILE not found!"
        exit 1
    fi

    echo "Analyzing $LOG_NAME log..."


    echo "----------------------------------------------------" >> "$REPORT_FILE"
    echo "📅 Report generated on: $(date)" >> "$REPORT_FILE"
    echo "📘 Log analyzed: $LOG_NAME" >> "$REPORT_FILE"
    echo "----------------------------------------------------" >> "$REPORT_FILE"

    awk '{print $2}' "$LOG_FILE" | sort | uniq -c | awk '{print "Device:", $2, "| Entries:", $1}' >> "$REPORT_FILE"

    FIRST_TS=$(head -1 "$LOG_FILE" | awk '{print $1}')
    LAST_TS=$(tail -1 "$LOG_FILE" | awk '{print $1}')
    echo "⏱ First Entry: $FIRST_TS" >> "$REPORT_FILE"
    echo "⏱ Last Entry: $LAST_TS" >> "$REPORT_FILE"
    echo "----------------------------------------------------" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    echo "✅ Analysis complete! Report saved to $REPORT_FILE"
}





