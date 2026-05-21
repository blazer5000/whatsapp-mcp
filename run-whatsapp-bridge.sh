#!/bin/bash

BRIDGE="/Users/aaron/whatsapp-mcp/whatsapp-bridge/whatsapp-bridge"
MAX_CRASHES=3
STABLE_THRESHOLD=60  # seconds — if bridge runs longer than this, reset crash counter
CRASH_COUNT=0

while true; do
    START=$(date +%s)
    "$BRIDGE"
    EXIT_CODE=$?
    ELAPSED=$(( $(date +%s) - START ))

    if [ $ELAPSED -ge $STABLE_THRESHOLD ]; then
        CRASH_COUNT=0
    fi

    CRASH_COUNT=$(( CRASH_COUNT + 1 ))

    if [ $CRASH_COUNT -ge $MAX_CRASHES ]; then
        osascript -e 'display alert "WhatsApp Bridge Failed" message "The bridge has crashed 3 times in a row and has stopped restarting.\n\nPlease check the logs:\n~/whatsapp-mcp/whatsapp-bridge.log\n\nTo restart manually, run:\nlaunchctl start com.aaron.whatsapp-bridge" as critical buttons {"OK"}'
        exit 0
    else
        osascript -e "display notification \"WhatsApp bridge stopped (exit code $EXIT_CODE). Restarting… ($CRASH_COUNT of $((MAX_CRASHES - 1)) retries)\" with title \"WhatsApp Bridge Down\" sound name \"Basso\""
        sleep 5
    fi
done
