#!/bin/bash
#
# PhantomGrid Scenario 83
# Auto-install & auto-enroll Wazuh Agent
#

### ================= CONFIGURATION ================= ###
WAZUH_MANAGER_IP="10.83.17.5" #CHANGE WITH YOUR WAZUH IP
AGENT_NAME="victim-host"

LOG_BASE="/var/log/phantomgrid"
INFOSTEALER_LOG_DIR="$LOG_BASE/infostealer"

### ================= SAFETY CHECK ================= ###
if systemctl is-active wazuh-agent >/dev/null 2>&1; then
  echo "[+] Wazuh agent already running. Exiting."
  exit 0
fi

echo "[*] Starting PhantomGrid Wazuh Agent setup..."

### ================= INSTALL WAZUH AGENT ================= ###
curl -sO https://packages.wazuh.com/4.x/wazuh-agent.sh

bash wazuh-agent.sh <<EOF
$WAZUH_MANAGER_IP
$AGENT_NAME
EOF

systemctl daemon-reexec
systemctl enable wazuh-agent
systemctl start wazuh-agent

### ================= PREPARE LOG DIRECTORY ================= ###
mkdir -p "$INFOSTEALER_LOG_DIR"
chmod -R 755 "$LOG_BASE"

### ================= GENERATE SIMULATED LOGS ================= ###
cat <<EOF > "$INFOSTEALER_LOG_DIR/execution.log"
{
  "timestamp": "2026-02-10T10:37:12Z",
  "host": "victim-host",
  "event_type": "process_execution",
  "process_name": "infostealer_sim.py",
  "language": "Python",
  "os": "Linux",
  "browser": "Chrome",
  "profile": "Default",
  "cookie_name": "SESSIONID",
  "token_prefix": "ya29"
}
EOF

cat <<EOF > "$INFOSTEALER_LOG_DIR/network.log"
{
  "timestamp": "2026-02-10T10:37:15Z",
  "event_type": "exfiltration",
  "destination_ip": "10.83.17.66",
  "destination_port": 9137,
  "protocol": "HTTP",
  "c2_hostname": "fake-c2",
  "encrypted": false
}
EOF

### ================= CONFIGURE WAZUH LOG COLLECTION ================= ###
cat <<EOF >> /var/ossec/etc/ossec.conf

<!-- PhantomGrid Scenario 83: Infostealer Browser Tokens -->
<localfile>
  <log_format>json</log_format>
  <location>/var/log/phantomgrid/infostealer/execution.log</location>
</localfile>

<localfile>
  <log_format>json</log_format>
  <location>/var/log/phantomgrid/infostealer/network.log</location>
</localfile>

EOF

### ================= RESTART AGENT ================= ###
systemctl restart wazuh-agent

echo "[+] PhantomGrid Scenario 83 agent enrollment completed."
exit 0
