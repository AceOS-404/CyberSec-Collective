# Network Hacking — Post-Connection Attacks: Information Gathering

**Contributor:** AceOS | **Track:** Red Team | **Status:** Environment verification completed; Windows 11 Enterprise evaluation ISO download in progress. Guest installation and scanning not yet performed

## Objective
Prepare a disposable Windows virtual machine as an expressly authorised target for future Nmap/Zenmap network discovery from Kali Linux. No device scanning or attack is claimed here.

## Why a VM instead of a physical Windows computer?
- **Recovery:** A clean snapshot can be restored when an experiment breaks a guest configuration; real computers may need lengthy repair or restoration.
- **Isolation:** A dedicated lab interface can keep experiments off household Wi-Fi and production systems.
- **Repeatability:** The same baseline and software can be reused to compare results.
- **Evidence:** VM versions, virtual network settings, tested services and outcomes can be documented without disclosing real household device identifiers.
- **Limits:** A VM is not identical to physical hardware: drivers, networking, hypervisor artefacts and security controls can affect observations. Never claim that a result automatically applies to a real computer.

## Planned layout: Kali Linux running on the physical host

```text
Kali Linux host (AceOS)
   | virtual host-only interface (e.g. vboxnet0)
   +--- Host-only lab network --- Windows VM (test target)
                                   |
                                   +-- Optional separate NAT adapter for updates only
```

**Networking correction:** The host is not automatically a member of a VirtualBox NAT Network. Host-only networking explicitly connects the physical Kali host and the guest to a private virtual network. Standard per-VM NAT alone is not suitable for unrestricted inbound host-to-guest discovery. If Kali and Windows are *both* VirtualBox guests, place both on the same isolated Internal Network or host-only network. Do not bridge the test target onto the household Wi-Fi.

## Setup checklist (commands are reference only — not executed in this record)

On the Kali host, verify VirtualBox:

```bash
VBoxManage --version
```

If not installed, Kali's official repository approach:

```bash
sudo apt update
sudo apt install virtualbox linux-headers-generic
```

Launch with `virtualbox`. Download an authentic Windows 11 ISO through Microsoft's official download page; an ISO is **not** installed through `apt`. In VirtualBox, create the Windows VM, attach the ISO, allocate at least 4 GB RAM and 64 GB disk (more if available), and configure the Windows 11 guest compatibility features supported by the installed VirtualBox version. Use a **Host-Only Adapter** for the lab network; add NAT only if updates are necessary, and disable NAT during experiments where full isolation matters.

After Windows setup, take a snapshot called `Windows-Clean-Baseline`. Before any scan, confirm the Kali host and the Windows guest have addresses on the intended host-only subnet and that the target is expressly in scope. Windows firewall and network profile may affect ping and scan output; record them rather than weakening protections without reason.

## Progress log — 2026-11-23

**Evidence reviewed:** A screenshot from the Kali Linux desktop shows:
- `VBoxManage --version` was run in the host terminal and returned a VirtualBox **7.2.20 Debian build** version string (the remaining build suffix is partially obscured by the browser).
- `sudo apt update` was run; terminal output shows repository package-list activity. This does **not** establish that any installation or upgrade was completed.
- Firefox is open on Microsoft's official **Windows 11 Enterprise Evaluation Center** download page with **ISO — Enterprise download, 64-bit edition** selected (not LTSC).
- Firefox's downloads panel shows that the ISO download is **in progress** (approximately 707 MB of 7.7 GB at screenshot time). The image does not prove that the download finished or that its checksum was validated.
- Windows 11 has **not** been installed in VirtualBox, and the lab networking, snapshot and scans remain pending.

**Evidence handling:** The original screenshot was reviewed in the course conversation but was **not committed** to GitHub. Any later public screenshot must be reviewed and redacted first. The screenshot is evidence only of the steps visibly completed, not a successful VM installation.

## Practical status
- [x] VirtualBox version checked (7.2.20 Debian build, suffix not fully visible)
- [x] Official Windows 11 Enterprise Evaluation ISO download started
- [ ] Official Windows ISO download completed and integrity verified
- [ ] Windows VM created and installed
- [ ] Host-only lab network configured
- [ ] Windows baseline snapshot created
- [ ] Lab connectivity verified
- [ ] Authorised information-gathering scan completed and documented

## Evidence policy
Only publish original screenshots after removing names, credentials, device identifiers, product keys, account details and any other private information. Record exact commands and actual outcomes; do not present planned commands as completed actions.

## References
- Kali Linux: https://www.kali.org/docs/virtualization/install-virtualbox-host/
- Oracle VirtualBox networking: https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/networkingdetails.html
- Microsoft Windows 11 ISO: https://www.microsoft.com/software-download/windows11

**Authorised, controlled labs only.** This repository documents training; it is not permission to access other systems.