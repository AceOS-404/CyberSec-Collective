# ACEOS | Ethical Hacking from Scratch

**Practical cybersecurity learning portfolio** documenting reproducible Kali Linux labs, network fundamentals, offline password verification, troubleshooting, and eventually red/blue-team collaboration.

> [!CAUTION]
> **AUTHORISED LABS ONLY.** Every practical documented here must be performed in an isolated, protected training environment, on deliberately vulnerable systems or public training data, or under explicit written permission identifying the permitted systems, time window and activities. **Do not run these exercises on strangers' networks, live production infrastructure, or systems you do not control or have authority to test.**
>
> This repository is for education, not permission to access any system. The contributors do not authorise others to misuse the material, and cannot guarantee the safety or legality of modified uses. Your own actions remain your responsibility.

## Practical work

The practical reports live in the **Red-Team** folder. Each lab has its own notes, commands, explanations, outcomes and evidence folder. The **Blue-Team** and **Purple-Team** folders are reserved for future defensive and joint exercises.

- [Kali environment and network fundamentals](Red-Team/01-Kali-and-Network-Fundamentals/README.md)
- [Offline WPA training-capture verification — confirmed result](Red-Team/02-WPA-Offline-Verification/README.md)
- [Simulated Wi-Fi network — troubleshooting record](Red-Team/03-Simulated-WiFi/README.md)

## Repository organisation

```text
Red-Team/
  01-Kali-and-Network-Fundamentals/
    README.md
    screenshots/
  02-WPA-Offline-Verification/
    README.md
    screenshots/
  03-Simulated-WiFi/
    README.md
    configs/
    screenshots/
Blue-Team/
  README.md
Purple-Team/
  README.md
docs/
  LAB-TEMPLATE.md
  PUBLICATION-SAFETY.md
scripts/
  verify-tools.sh
CONTRIBUTING.md
.gitignore
```

## Confirmed achievement

In Kali Linux 2026.3 running inside VirtualBox, **Aircrack-ng 1.7** processed the public `wpa2.eapol.cap` training capture (ESSID **Harkonen**), tested **three candidate passwords**, and displayed `KEY FOUND! [ 12345678 ]`. This is an **offline verification with a known public test sample**, **not** a live-network compromise or proof of radio-based packet capture. See [Lab 02](Red-Team/02-WPA-Offline-Verification/README.md).

## How lab reports work

Each exercise documents (1) objective, (2) lab scope, (3) prerequisites, (4) commands and what each one means, (5) results with screenshots when available, (6) limitations/failures, (7) security and defensive implications, and (8) next tasks. Failures are recorded honestly; outcomes aren't embellished.

## Collaboration

This project began as an individual red-team study log. A potential blue-team partner has been invited but **has not confirmed participation**. Red and blue exercise notes remain separate; joint exercises belong in Purple-Team and should link back to both individual reports. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Learning sources

- [Kali Linux](https://www.kali.org/)
- [Aircrack-ng](https://www.aircrack-ng.org/) and [public sample captures](https://github.com/aircrack-ng/aircrack-ng)
- [Oracle VirtualBox](https://www.virtualbox.org/)
- Independently authored notes while studying *Learn Ethical Hacking From Scratch* (Zaid Sabih / zSecurity); **no paid course materials are redistributed**.

*Student laboratory records, not a professional penetration-test report or accredited certification.*
