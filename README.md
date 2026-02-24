# SCENARIO 83: Infostealer Browser Tokens

**Category:** Malware Operations, Credential Access  
**Sector:** Enterprise  
**Target:** Victim Workstation (Linux VM, monitored via SIEM)  
**Artifacts:** 36 Flags  
**Difficulty:** Intermediate    

---

## 📜 Mission Briefing

PhantomGrid SOC detected anomalous outbound traffic from an employee workstation.  
Threat intelligence indicates a Browser Infostealer malware harvesting cookies, session tokens, and OAuth artifacts, then exfiltrating them to a fake C2 server using a non-standard port.

This lab environment consists of:

- 1x Wazuh Manager (SIEM)
- 1x Victim Workstation (Wazuh Agent installed)

The attack has already been executed before participant access.  
All relevant logs have been collected and forwarded to the SIEM.

Participants act as Blue Team Analysts.

>Flag format:       
>PHANTOMGRID{answer}        
>If a log already contains PHANTOMGRID{...}, submit it as-is.       

---

# Lab Setup

1. Start the scenario.
2. Both VMs auto-start.
3. Wazuh services are already running.
4. The attack has already occurred.
5. Investigate via Wazuh Dashboard only.

Participants DO NOT need shell access to the victim machine.

---

# Tasks (36 Flags)


## Phase 1: Detection & Initial Triage 
Difficulty : 🟢 Easy

>HINT:
>Filter alerts by agent.name:"victim-host" and sort by earliest timestamp. Focus on process execution logs.

1. What host name triggered the first alert?
2. What file name indicates malware execution?
3. What process name is responsible?
4. What scripting language is used?
5. What operating system is reported?
6. What is the UTC timestamp of initial execution?

---

## Phase 2: Browser Artifact Access 
Difficulty : 🟢 Easy

>HINT:
>Search for logs containing keywords: cookie, browser, chrome, profile. Look at file access activity before network traffic.

7. Which browser is being accessed?
8. What browser profile name is targeted?
9. What cookie name is harvested?
10. What domain does the cookie belong to?
11. What type of authentication artifact is stolen?
12. Is MFA bypass possible using this artifact?

---

## Phase 3: Token Analysis 
Difficulty : 🟡 Medium

>HINT:
>Inspect the token string carefully. Identify service context and match to MITRE ATT&CK technique for browser credential theft.

13. What service or SaaS platform does the token belong to?
14. What is the token prefix observed?
15. Is the token a session token or refresh token?
16. Which MITRE ATT&CK technique ID best applies?
17. What risk does reuse of this token create?
18. What type of account could be compromised?

---

## Phase 4: Exfiltration Analysis 
Difficulty : 🟡 Medium

>HINT:
>Correlate network.log with execution.log. Look for outbound connections immediately after token harvesting.

19. What destination IP received the data?
20. What destination port was used?
21. What network protocol was observed?
22. Was the exfiltration encrypted?
23. What C2 host name is identified?
24. What file confirms data was sent?

---

## Phase 5: Impact & Detection Gaps 
Difficulty : 🟡 Medium

>HINT:
>Review alert severity and rule descriptions. Think from a defensive perspective: what failed, and what should be improved?

25. What access level does the attacker gain?
26. Which log source confirms browser access?
27. Which log source confirms outbound traffic?
28. What detection gap allowed this activity?
29. What control would best prevent token reuse?
30. What incident response action should be performed first?

---

## Phase 6: Final Analysis & Classification 
Difficulty : 🟢 Easy

>HINT:
>Map findings to MITRE ATT&CK tactic categories. Review overall impact and severity.

31. What MITRE ATT&CK tactic is primary?
32. What security tool detected the activity?
33. What browser security setting could reduce risk?
34. What severity level should be assigned?
35. What is the final investigation status message?
36. What is the final completion flag?

---

## 🔐 DECLASSIFIED SOLUTIONS (ANSWERS)
<details>
<summary><strong>CLICK TO REVEAL ANSWER</strong></summary>
Phase 1

1. PHANTOMGRID{victim-host}
2. PHANTOMGRID{infostealer.sh}
3. PHANTOMGRID{bash}
4. PHANTOMGRID{Bash}
5. PHANTOMGRID{Linux}
6. PHANTOMGRID{2026-02-24T10:15:42Z}

Phase 2

7. PHANTOMGRID{Chrome}
8. PHANTOMGRID{Default}
9. PHANTOMGRID{SESSIONID}
10. PHANTOMGRID{mail.phantomnet.local}
11. PHANTOMGRID{Token}
12. PHANTOMGRID{Yes}

Phase 3

13. PHANTOMGRID{PhantomMail}
14. PHANTOMGRID{ya29}
15. PHANTOMGRID{Session}
16. PHANTOMGRID{T1555.003}
17. PHANTOMGRID{Account Takeover}
18. PHANTOMGRID{User}

Phase 4

19. PHANTOMGRID{10.10.10.66}
20. PHANTOMGRID{9137}
21. PHANTOMGRID{HTTP}
22. PHANTOMGRID{No}
23. PHANTOMGRID{fake-c2.local}
24. PHANTOMGRID{network.log}

Phase 5

25. PHANTOMGRID{Authenticated}
26. PHANTOMGRID{execution.log}
27. PHANTOMGRID{network.log}
28. PHANTOMGRID{No Egress Monitoring}
29. PHANTOMGRID{Token Binding}
30. PHANTOMGRID{Session Revocation}

Phase 6

31. PHANTOMGRID{Credential Access}
32. PHANTOMGRID{Wazuh}
33. PHANTOMGRID{Disable Cookie Persistence}
34. PHANTOMGRID{High}
35. PHANTOMGRID{INFOSTEALER_CONFIRMED}
36. PHANTOMGRID{SCENARIO_83_COMPLETE}

</details>