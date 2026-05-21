#!/bin/bash
# WhatsApp MCP startup wrapper
# Starts the Go bridge if not already running, then launches the Python MCP server.

BRIDGE_BIN="$HOME/whatsapp-mcp/whatsapp-bridge/whatsapp-bridge"
BRIDGE_LOG="/tmp/whatsapp-bridge.log"
MCP_SERVER_DIR="$HOME/whatsapp-mcp/whatsapp-mcp-server"

# Start the Go bridge if not already running
if ! pgrep -f "whatsapp-bridge" > /dev/null 2>&1; then
    nohup "$BRIDGE_BIN" > "$BRIDGE_LOG" 2>&1 &
    # Give it a moment to initialise before the MCP server tries to connect
    sleep 3
fi

# Launch the Python MCP server (Claude Code communicates with this via stdio)
cd "$MCP_SERVER_DIR"
exec "$HOME/.local/bin/uv" run main.py
