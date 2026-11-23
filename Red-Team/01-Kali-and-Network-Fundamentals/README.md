# Lab 01 — Kali setup, networking and tool verification

**Status:** Environment prepared; learning ongoing  
**Scope:** Kali Linux installed on personal HP laptop; isolated Kali guest in Oracle VirtualBox.

## Objective
Create a repeatable training environment and confirm its essential security tools. Learn client/server requests, responses, packets, MAC addressing and IP routing.

## Environment observed
- Host: Kali Linux, previously updated to kernel `7.2.15+kali-amd64` during troubleshooting.
- Guest: official Kali Linux 2026.3 pre-built VirtualBox image.
- Guest settings: **4 GiB RAM**, **2 vCPUs**, **NAT** networking, internet confirmed.
- Tools reported present: Nmap, Wireshark, tshark, tcpdump, Aircrack-ng, airodump-ng, aireplay-ng, macchanger, Python 3.

## Commands and why we used them

| Command | Meaning |
|---|---|
| `uname -r` | Check the currently running Linux kernel version. |
| `apt policy linux-image-amd64 linux-headers-amd64` | Inspect available kernel and header packages before installing VirtualBox. |
| `sudo apt update` | Refresh package index metadata. Does not install upgrades by itself. |
| `sudo apt install linux-image-amd64 linux-headers-amd64` | Install a matching current kernel/header pair for the host. |
| `sudo apt install virtualbox virtualbox-dkms dkms` | Install VirtualBox and dynamic kernel module build support on the host. |
| `ping -c 4 kali.org` | Check guest DNS and network reachability (ICMP replies are not guaranteed). |
| `sudo apt full-upgrade` | Upgrade guest packages with dependency resolution; review proposed changes before accepting. |
| `sudo apt --fix-broken install` | Attempt to repair incomplete dependencies. |
| `sudo apt clean` | Remove locally cached downloaded packages, useful after a damaged archive. |
| `nmap -sV 127.0.0.1` | Safely explore service-version discovery against the guest's own loopback address. |

## Troubleshooting recorded
- The original running host kernel had no corresponding header package in the repository, while a newer kernel and headers were available.
- During a guest tool installation, dependency errors appeared. A downloaded `libgcc-15-dev` archive then failed to unpack with a decompression/EOF error.
- Cleaning the APT cache and repairing dependencies resolved the reported package problem.
- Tool verification subsequently returned OK for all nine checked commands.

## Networking concepts in my own words
- A network links devices so they can exchange data and access resources.
- Wireless access points bridge Wi-Fi clients to a local network; routers move IP packets towards remote destinations; servers typically respond to application requests.
- MAC addresses identify link-layer interfaces locally; IP addresses are used for logical addressing and routing.
- Packet capture is observation, not automatically packet injection, password recovery or session hijacking. HTTPS and Wi-Fi encryption limit what passive observers can interpret.

## Evidence
Add redacted installation and tool-verification screenshots to `screenshots/` once approved for public sharing.
