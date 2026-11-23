# Wireless Encryption — Security Theory

## Objective

Understand the security properties and common failure modes of WEP, WPA, WPA2 and WPA3, and identify suitable mitigations.

## 1. WEP (Wired Equivalent Privacy)

WEP uses the RC4 stream cipher with a short initialization vector (IV). Weaknesses in its design and key handling allow attackers to recover keys from sufficient captured traffic. A long or complicated WEP password does **not** repair the protocol's design flaws.

**Assessment:** Obsolete and broken.  
**Mitigation:** Disable WEP, replace equipment that supports only WEP, and use WPA3-Personal or WPA2-AES where necessary.

## 2. Original WPA

The original WPA was designed as a transitional improvement over WEP and commonly uses TKIP. TKIP is now obsolete and should not be selected for modern deployments.

**Assessment:** Legacy protocol; avoid.  
**Mitigation:** Disable WPA/TKIP configurations.

## 3. WPA2

WPA2 commonly uses AES-CCMP for data protection. The cryptographic protection is not equivalent to the strength of a human-selected password. With WPA2-Personal (PSK), an adversary possessing suitable authentication material may perform **offline guesses** against candidate passwords. If the password is easily guessed or appears in an attacker's candidate set, it may be recovered.

The candidate set need not be a fixed wordlist: attackers may also generate guesses using patterns, rules, or brute-force search. Therefore, it is inaccurate to say that a WPA2 password is safe merely because it does not appear in one dictionary.

A successful password guess does **not** mean AES encryption itself was broken.

**Assessment:** Suitable when correctly configured with AES-CCMP and a long, unique, randomly generated passphrase.  
**Mitigation:** Prefer a random passphrase, disable WPS, keep firmware current, and avoid TKIP or WPA/WPA2 mixed legacy modes where possible.

## 4. WPA3

WPA3-Personal uses SAE (Simultaneous Authentication of Equals), which improves resistance to passive offline dictionary attacks. WPA3 also has newer configuration and implementation considerations; it is not a guarantee against all threats.

**Assessment:** Preferred for modern supported devices.  
**Mitigation:** Choose WPA3-Personal when all clients support it; otherwise use WPA2-AES with strong configuration. Assess transition mode and client compatibility before enabling mixed modes.

## 5. Quick comparison

| Protocol | Main concern | Recommendation |
| --- | --- | --- |
| WEP | Fundamental protocol weaknesses | Never use |
| Original WPA / TKIP | Obsolete protection | Never use |
| WPA2-Personal / AES-CCMP | Weak passphrases, WPS, legacy configurations | Acceptable if hardened |
| WPA3-Personal / SAE | Configuration, implementation, downgrade/transition considerations | Preferred |

## Red-team interpretation

During an **authorised** assessment, the tester should report the wireless encryption protocol, authentication mode, use of WPS, and exposed legacy configuration. Findings must differentiate a weak pre-shared key from a break in the data-encryption algorithm.

## Learning takeaway

The strongest practical defence is modern encryption combined with strong authentication, secure router configuration, up-to-date firmware and removal of vulnerable convenience features.

**Evidence status:** Theory only. No new capture, cracking result, or lab screenshot is claimed in this section.
