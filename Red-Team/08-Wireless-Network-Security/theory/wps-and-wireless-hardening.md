# WPS Vulnerabilities and Wireless Hardening

## What is WPS?

Wi-Fi Protected Setup (WPS) was designed to simplify connecting devices to wireless networks. Common enrollment methods include push-button configuration and PIN-based enrollment.

## PIN-related weakness

Some implementations of WPS PIN enrollment are vulnerable to online guessing because the PIN verification design reduces the effective search space. On affected devices, insufficient rate limiting or lockout protections can make the issue more severe.

This weakness is in **WPS enrollment**, not in AES or WPA2 encryption itself. Some tools used by security researchers to assess WPS include Reaver, but this theory note does not demonstrate or authorise attacks.

**Important corrections to older training material:**
- A universal “10-hour crack time” is not reliable; susceptibility and duration depend on router implementation, lockout, throttling and other factors.
- WPS is not always breakable on modern routers; some disable PIN enrollment or enforce protections.
- The WPS PIN design is not simply “an eight-character password”; its checksum and split verification matter.
- WPS push-button and WPS PIN modes should not be treated as identical attack surfaces.
- WPS PIN recovery does not work by cryptographically reversing AES encryption.

## WPA2 password-guessing risk

For WPA2-Personal, weak passwords can be exposed to offline guessing when an attacker has obtained appropriate authentication data. A password missing from a particular dictionary may still be guessed by generated candidates or another attack strategy.

## Recommended hardening checklist

1. **Use WPA3-Personal** where supported, or WPA2-Personal with AES-CCMP.
2. **Disable WEP, original WPA and TKIP.**
3. **Disable WPS**, especially PIN-based enrollment. Confirm the router did not leave WPS active on another band or interface.
4. **Set a long, unique, random Wi-Fi passphrase** rather than a common word or predictable phrase.
5. **Change the router administrator credentials**; do not reuse the wireless passphrase.
6. **Install supported firmware updates** from the router manufacturer.
7. **Disable unnecessary remote management** and review exposed administration services.
8. **Separate guests and untrusted IoT devices** from sensitive devices when router capabilities permit.
9. **Review connected devices** periodically; investigate unknown clients before taking action.
10. **Retire equipment** that cannot support adequately secure wireless configurations.

## Example authorised configuration audit — template only

| Control | Observed configuration | Risk | Recommendation |
| --- | --- | --- | --- |
| Wi-Fi security mode | Not assessed | Unknown | Verify WPA3 or WPA2-AES |
| WPS enrollment | Not assessed | Unknown | Disable |
| Router firmware | Not assessed | Unknown | Check vendor updates |
| Administrator authentication | Not assessed | Unknown | Set unique strong credentials |
| Guest network isolation | Not assessed | Unknown | Enable where useful |

Do not substitute “Not assessed” with passing results until there is actual evidence.

## Ethical scope

Perform configuration reviews and testing only on devices you own or for which you have explicit permission. Avoid publishing real network names, credentials, device identifiers, unredacted administrative screenshots or private packet captures.

**Evidence status:** Theory and audit template only; no practical audit was performed.
