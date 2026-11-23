# Network Hacking — Post-Connection Attacks: Information Gathering

**Contributor:** AceOS | **Track:** Red Team | **Status:** Planning/setup guide — installation and scanning not yet verified

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

## Practical status
- [ ] VirtualBox version checked
- [ ] Official Windows ISO obtained
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