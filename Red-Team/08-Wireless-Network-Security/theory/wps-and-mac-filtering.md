# WPS, MAC Filtering and Wireless Access Controls

**Track:** Red Team | **Lesson type:** Theory only | **Practical status:** Not performed

## WPA2 / WPA3 versus WPS

- **WPA2-Personal** protects Wi-Fi access using a shared passphrase and normally AES-CCMP. Use a long, unique, randomly generated passphrase.
- **WPA3-Personal** uses SAE for improved resistance to passive offline password-guessing attacks. Prefer WPA3 where supported.
- **WPS (Wi-Fi Protected Setup)** is a convenience method for pairing devices; it is **not** a wireless encryption standard or an alternative to WPA2/WPA3.
- Some WPS **PIN-based** implementations have weaknesses that may permit PIN guessing and subsequent recovery of wireless credentials, especially without effective rate limiting/lockout.
- **Recommended hardening:** Disable WPS (particularly PIN-based WPS) when not needed. Disabling it does not prevent devices from joining normally with the correct Wi-Fi password.
- Keeping WPS enabled does **not** prevent studying post-connection topics such as ARP or network mapping. It may nevertheless increase wireless access risk and should not be left enabled merely for those lessons.

## MAC address filtering (allowlist / denylist)

A MAC address is a link-layer identifier used on a local network. Many wireless routers offer a filter:

- **Allowlist:** Only MAC addresses entered into the router's list are allowed to associate with the Wi-Fi access point.
- **Denylist:** Devices with specified MAC addresses are blocked.

**Limitations:** MAC addresses can often be observed locally and impersonated (MAC spoofing); some devices also use randomized MAC addresses. MAC filtering is therefore a lightweight device-management or convenience control, **not strong authentication** and not a substitute for WPA2/WPA3 or a strong password. It may also introduce administration and compatibility problems.

## Connection security is not post-connection security

WPA2/WPA3 and WPS configuration govern **access to Wi-Fi**. Once a device is connected, additional issues can arise, including untrusted peers, insecure services, ARP spoofing and other man-in-the-middle scenarios. MAC filtering does not protect traffic from a malicious device that is already allowed onto the network. Additional controls include client isolation, segmentation, secure HTTPS/TLS usage, monitoring and appropriate network protections.

## Suggested authorised router configuration review (not yet performed)

1. Check that WPA3-Personal or WPA2-AES is enabled (not WEP, legacy WPA or TKIP).
2. Review whether WPS is active and disable it if not required.
3. Check whether MAC allowlisting/denylisting is offered; document its limitations.
4. Verify the administrator account, firmware update status and guest-network isolation when authorised.

**Access note:** Router administration access may be managed by the ISP. Do not reset or attempt to circumvent a provider-managed router; request permission or use a personally controlled isolated lab router.

## Publication and ethics

No router login, WPS changes, MAC filter changes, packet interception or practical attack was performed for this lesson. Future screenshots must have credentials, MAC addresses, serial numbers, account information and other sensitive details redacted **before publishing**. Test only in a contained environment or with explicit authorisation.

## Source/context

Independently written study notes following the instructor's explanation of WPS and router MAC filtering. The accompanying *Post Connection Attacks* PDF addresses network mapping, ARP/MITM concepts and later VPN defenses; the WPS/MAC-filter discussion comes from the video lesson, not a claim that these settings are covered on the PDF's slides.
