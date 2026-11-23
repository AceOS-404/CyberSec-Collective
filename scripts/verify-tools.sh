#!/usr/bin/env bash
set -u
for tool in nmap wireshark tshark tcpdump aircrack-ng airodump-ng aireplay-ng macchanger python3; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '[OK] %s\n' "$tool"
  else
    printf '[MISSING] %s\n' "$tool"
  fi
done
