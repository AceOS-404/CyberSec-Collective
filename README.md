# Cybersecurity Training Portfolio

A collaborative cybersecurity learning repository for independently documented offensive and defensive security training, followed by jointly planned Purple Team exercises.

> [!CAUTION]
> **AUTHORISED LABS ONLY.** Every practical documented here must be performed in an isolated, protected training environment, on deliberately vulnerable systems or public training data, or under explicit written permission identifying the permitted systems, time window and activities. **Do not run these exercises on strangers' networks, live production infrastructure, or systems you do not control or have authority to test.**
>
> This repository is for education, not permission to access any system. The contributors do not authorise others to misuse the material, and cannot guarantee the safety or legality of modified uses. Your own actions remain your responsibility.

## Teams and practical work

- **[Red Team](Red-Team/README.md)** — Offensive-security theory, authorised laboratory exercises and practical reports. Maintained by the Red Team contributor.
- **[Blue Team](Blue-Team/README.md)** — Defensive-security study notes, detection, monitoring and response exercises. Led by **Caitz**.
- **[Purple Team](Purple-Team/README.md)** — Future joint projects combining controlled Red Team simulations with Blue Team analysis, improvements and retesting. No joint practical is claimed yet.

Each contributor manages the content for their own team; shared Purple Team work is planned and reviewed together. Studying one another's published notes is encouraged. The folder split indicates authorship and responsibility, not automatic GitHub permission enforcement.

## Repository organisation

```text
Red-Team/
  README.md
  01-Kali-and-Network-Fundamentals/
  02-WPA-Offline-Verification/
  03-Simulated-WiFi/
  08-Wireless-Network-Security/
  09-Post-Connection-Attacks/
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

## How lab reports work

Individual reports contain objectives, scope, environment, concepts, commands with explanations, genuine results, troubleshooting, limitations and defensive implications. Theory and planned experiments are labelled separately from completed practicals. Screenshots and supporting evidence are reviewed and sensitive details redacted before publication.

## Collaboration

**Red Team:** independent offensive-security course work and controlled labs.

**Blue Team — Caitz:** independently maintained defensive-security course work and labs.

**Purple Team:** joint, explicitly authorised exercises in isolated environments: define a scenario, carry out a controlled test, investigate and respond, improve controls, then retest and record the outcome.

Contributors should submit changes to their own team areas and use reviewed pull requests for shared changes. See [CONTRIBUTING.md](CONTRIBUTING.md). Caitz has agreed to the collaboration concept; this README does not assert that GitHub access or contributions have already been completed.

## Learning sources

- [Kali Linux](https://www.kali.org/)
- [Aircrack-ng](https://www.aircrack-ng.org/)
- [Oracle VirtualBox](https://www.virtualbox.org/)
- Independently written notes from relevant training and courses; paid course materials are not redistributed.

*Educational lab documentation. Not a professional penetration-test report or a claim of certification.*
