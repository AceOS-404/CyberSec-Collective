# Post-Connection Attacks — Lab Progress

**Track:** Red Team  
**Course topic:** Post-connection attacks, beginning with network identification before mapping / ARP concepts  
**Date:** 2026-11-23  
**Status:** Step 1 complete — gateway discovery and connectivity verification. No post-connection attack has been performed.

> [!CAUTION]
> **AUTHORISATION AND SCOPE:** Test only equipment and network ranges under your control or expressly authorised for testing. This progress report records passive configuration inspection and four ICMP echo requests to the local gateway. It does not establish permission to intercept, redirect, or interfere with other devices' traffic.

## Environment

- Linux host: Kali Linux (AceOS prompt)
- Interface: `wlan0`
- DHCP-assigned source IP: `192.168.0.108` (observed at time of test; may change)
- Default gateway: `192.168.0.1`
- Local subnet: `192.168.0.0/24`
- The gateway's web interface displayed a HEROTEL-branded router login page over HTTP. Merely reaching this page confirms connectivity, not administrative access.
- A VirtualBox guest previously showed a separate `10.0.1.x` address; its exact network attachment mode has not been confirmed.

## Step 1 — Inspect routing information (completed)

**Command:**

```bash
ip route
```

**Observed terminal output:**

```text
default via 192.168.0.1 dev wlan0 proto dhcp src 192.168.0.108 metric 600
192.168.0.0/24 dev wlan0 proto kernel scope link src 192.168.0.108 metric 600
```

**Explanation:** The default route sends traffic for destinations not otherwise covered by more-specific routes to the gateway `192.168.0.1`, via `wlan0`. The directly connected route identifies the local subnet. `src` shows the IP chosen as the source address for traffic on that route; `proto dhcp` identifies the default route as learned via DHCP.

## Step 2 — Ping local gateway (completed)

**First attempt — syntax error:**

```bash
ping -c 192.168.0.1
# ping: invalid argument: '192.168.0.1'
```

The `-c` flag requires a packet count, not an IP address.

**Corrected command:**

```bash
ping -c 4 192.168.0.1
```

**Observed result (screenshot supplied in conversation):**

```text
64 bytes from 192.168.0.1: icmp_seq=1 ttl=64 time=4.88 ms
64 bytes from 192.168.0.1: icmp_seq=2 ttl=64 time=6.52 ms
64 bytes from 192.168.0.1: icmp_seq=3 ttl=64 time=4.92 ms
64 bytes from 192.168.0.1: icmp_seq=4 ttl=64 time=1.58 ms

4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 1.576/4.474/6.522/1.799 ms
```

**Interpretation:** The gateway returned ICMP echo responses to all four requests. The gateway is reachable from this Linux host at the time of testing. This is not evidence that any other devices were discovered, probed, or accessed.

## Course roadmap (not yet performed)

The accompanying post-connection course PDF goes on to network mapping (Nmap/Zenmap), ARP and man-in-the-middle concepts, Bettercap, HTTPS/HSTS, DNS spoofing, fake access points, MITM detection, and VPNs. These are **upcoming topics**, not completed practicals.

## Evidence

The source screenshot of the corrected ping and route output was supplied in the course conversation on 2026-11-23. **Screenshot binary has not been committed to this repository**; this report transcribes only directly visible terminal results. A previous screenshot also shows the gateway login page.

## Next action

Follow the course's next step and add observed commands, exact outcomes, limitations, and appropriately redacted evidence after each authorised exercise. Do not assume a successful ping means a network is vulnerable.
