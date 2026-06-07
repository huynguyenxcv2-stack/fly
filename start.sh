#!/bin/sh

tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
sleep 2

tailscale up --auth-key="${TAILSCALE_AUTHKEY}" --hostname=fly-server --ssh --accept-dns=false

tail -f /dev/null
