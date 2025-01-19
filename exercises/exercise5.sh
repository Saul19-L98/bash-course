# ! /bin/bash
# Generate the log file name
LOG_FILE="log-$(date '+%Y-%m-%d-%H-%M-%S')"

# Write information to the log file
{
echo "Log started at $(date)"
echo "Hostname: $(hostname)"
echo "System Uptime: $(uptime)"
echo "Disk Usage: $(df -h)"
echo "Memory Usage: $(free -h)"
} > "$LOG_FILE"

#Print confirmation
echo "Log has been written to $LOG_FILE"
