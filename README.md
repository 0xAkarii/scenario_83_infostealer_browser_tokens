# SCENARIO 83: Infostealer Browser Tokens

**Category:** Malware Operations, Credential Access  
**Sector:** Enterprise  
**Target:** Victim Workstation (Dockerized, monitored via SIEM)  
**Artifacts:** 36 Flags  
**Difficulty:** Intermediate    

## 📜 Mission Briefing
**PhantomGrid SOC** detected anomalous outbound traffic from an employee workstation.
Threat intelligence indicates a **Browser Infostealer malware** harvesting **cookies, session tokens, and OAuth artifacts**, then exfiltrating them to a fake C2 server using a non-standard port.

You are tasked with a **Blue Team / SOC Investigation**:
1. **Detect:** Identify malicious execution and suspicious browser access via SIEM alerts.
2. **Analyze:** Extract stolen browser tokens and assess attacker objectives.
3. **Respond:** Map activity to MITRE ATT&CK and recommend remediation.

> **🚩 FLAG FORMAT:**
> The flag format is `PHANTOMGRID{answer}`.
> * **Example Question:** What port is used for exfiltration?
> * **Artifact Found:** `9137`
> * **Submission:** `PHANTOMGRID{9137}`
>
> *Note: If a log, alert, or output already contains `PHANTOMGRID{...}`, submit it as is.*

---

# Lab Setup

1. Start the scenario from the cyber range platform.
2. All containers and services start automatically.
3. Access the **SIEM Dashboard (Wazuh)** provided by the platform.

⚠️ Participants **do not** need to:
- Docker exec into containers  
- Access files directly on disk  
- Run exploit code  

All evidence is available via **SIEM alerts and collected logs**.

---

## 🔧 SIEM ACCESS & WAZUH CONFIGURATION

### 📊 Wazuh Dashboard Access
1. Open a browser inside the **Participant VM**.
2. Navigate to the **Wazuh Dashboard URL** provided.
3. Use the filter: `agent.name:"victim-host"`

---

## ⚔️ MITRE ATT&CK MAPPING

| ID | Technique | Description |
| :--- | :--- | :--- |
| **T1555.003** | Credentials from Web Browsers | Theft of cookies and browser tokens. |
| **T1539** | Steal Web Session Cookie | Session hijacking without passwords. |
| **T1059** | Command and Scripting Interpreter | Python-based infostealer execution. |
| **T1083** | File and Directory Discovery | Enumeration of browser profiles. |
| **T1041** | Exfiltration Over C2 Channel | Token exfiltration to attacker server. |
| **T1027** | Obfuscated Files or Information | Simplified malware simulation. |

---

## 🔵 Blue Team Tasks (36 Flags)

### Phase 1: Detection & Initial Triage 🟢 (Easy)

1.  What **host name** triggered the first alert?
2.  What **file name** indicates malware execution?
3.  What **process name** is responsible?
4.  What **scripting language** is used?
5.  What **operating system** is reported by the alert?
6.  What is the **UTC timestamp** of initial execution?

### Phase 2: Browser Artifact Access 🟢 (Easy)

7.  Which **browser** is being accessed?
8.  What **browser profile name** is targeted?
9.  What **cookie name** is harvested?
10. What **domain** does the cookie belong to?
11. What type of **authentication artifact** is stolen (cookie / token)?
12. Is **MFA bypass** possible using this artifact (Yes/No)?

### Phase 3: Token Analysis 🟡 (Medium)

13. What **service or SaaS platform** does the token belong to?
14. What is the **token prefix** observed?
15. Is the token a **session token or refresh token**?
16. Which **MITRE ATT&CK technique ID** best applies?
17. What **risk** does reuse of this token create?
18. What **type of account** could be compromised?

### Phase 4: Exfiltration Analysis 🟡 (Medium)

19. What **destination IP address** received the data?  
20. What **destination port** was used?
21. What **network protocol** was observed?
22. Was the exfiltration **encrypted** (Yes/No)?
23. What **C2 host name** is identified?
24. What **file or log** confirms data was sent?

### Phase 5: Impact & Detection Gaps 🟡 (Medium)

25. What **access level** does the attacker gain?
26. Which **log source** confirms browser access?
27. Which **log source** confirms outbound traffic?
28. What **detection gap** allowed this activity?
29. What **control** would best prevent token reuse?
30. What **incident response action** should be performed first?

### Phase 6: Final Analysis & Classification 🟢 (Easy)

31. What **MITRE ATT&CK tactic** is primary?
32. What **security tool** detected the activity?
33. What **browser security setting** could reduce risk?
34. What **severity level** should be assigned?
35. What is the **final investigation status message**?
36. What is the **final completion flag**?

---

## 🔐 DECLASSIFIED SOLUTIONS (ANSWERS ONLY)

<details>
<summary><strong>CLICK TO REVEAL SOLUTIONS</strong></summary>

### Phase 1
1. `PHANTOMGRID{victim-host}` | 2. `PHANTOMGRID{execution.log}` | 3. `PHANTOMGRID{infostealer_sim.py}` | 4. `PHANTOMGRID{Python}` | 5. `PHANTOMGRID{Linux}` | 6. `PHANTOMGRID{2026-02-10T10:37:12Z}`

### Phase 2
7. `PHANTOMGRID{Chrome}` | 8. `PHANTOMGRID{Default}` | 9. `PHANTOMGRID{SESSIONID}` | 10. `PHANTOMGRID{mail.phantomnet.local}` | 11. `PHANTOMGRID{Token}` | 12. `PHANTOMGRID{Yes}`

### Phase 3
13. `PHANTOMGRID{PhantomMail}` | 14. `PHANTOMGRID{ya29}` | 15. `PHANTOMGRID{Session}` | 16. `PHANTOMGRID{T1555.003}` | 17. `PHANTOMGRID{Account Takeover}` | 18. `PHANTOMGRID{User}`

### Phase 4
19. `PHANTOMGRID{10.83.17.66}` | 20. `PHANTOMGRID{9137}` | 21. `PHANTOMGRID{HTTP}` | 22. `PHANTOMGRID{No}` | 23. `PHANTOMGRID{fake-c2}` | 24. `PHANTOMGRID{network.log}`

### Phase 5
25. `PHANTOMGRID{Authenticated}` | 26. `PHANTOMGRID{execution.log}` | 27. `PHANTOMGRID{network.log}` | 28. `PHANTOMGRID{No Egress Monitoring}` | 29. `PHANTOMGRID{Token Binding}` | 30. `PHANTOMGRID{Session Revocation}`

### Phase 6
31. `PHANTOMGRID{Credential Access}` | 32. `PHANTOMGRID{Wazuh}` | 33. `PHANTOMGRID{Disable Cookie Persistence}` | 34. `PHANTOMGRID{High}` | 35. `PHANTOMGRID{INFOSTEALER_CONFIRMED}` | 36. `PHANTOMGRID{SCENARIO_83_COMPLETE}`

</details>