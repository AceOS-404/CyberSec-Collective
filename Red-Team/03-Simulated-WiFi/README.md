# Lab 03 — Virtual Wi-Fi radios and simulated WPA2 access point

**Status:** Partial — access point enabled, but client connection failed  
**Scope:** Fictional in-VM lab via `mac80211_hwsim` with no physical Wi-Fi emissions.

## Objective
Create simulated radios, start a WPA2-PSK access point, connect a simulated station, and understand troubleshooting logs.

## Commands and observations

| Command | Why | Observed |
|---|---|---|
| `modinfo mac80211_hwsim` | Verify Linux virtual-radio kernel module exists | Module information returned |
| `sudo modprobe mac80211_hwsim radios=2` | Create two virtual radios | `wlan0` and `wlan1` shown by `iw dev` |
| `iw dev` | List radio interfaces, types and PHY IDs | Two separate simulated PHYs visible |
| `command -v hostapd` | Check access-point software availability | `/usr/sbin/hostapd` |
| `sudo hostapd ~/wpa2-lab/hostapd.conf` | Start fictional AP | `AP-ENABLED` observed |
| `sudo iw dev wlan1 scan` | Attempt client discovery | Subsequent scanning/tx errors |
| `sudo wpa_supplicant -i wlan1 -c ~/wpa2-lab/client.conf -D nl80211` | Attempt authentication | Connection **not** established |
| `rfkill list` | Check soft/hard radio blocking | No blocks observed |

The AP logs repeatedly showed `handle_probe_req: send failed`. The client showed `CTRL-EVENT-SCAN-FAILED ret=-16`, authentication retries, and `CTRL-EVENT-SSID-TEMP-DISABLED`. These logs suggest a radio/transmission or driver-state issue; a definite root cause has **not** been proven.

## Configuration examples

Examples are in [configs/](configs/). Only fictional SSIDs and passphrases are used.

## Important distinction
An access point showing `AP-ENABLED` is not proof that a client has associated or completed a four-way handshake. This exercise must remain **partial** in the public record.

## Next action
Investigate virtual-radio state and monitor capabilities in a future isolated lab session. Do not claim successful handshake capture here.
