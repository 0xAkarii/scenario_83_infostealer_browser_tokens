#!/bin/sh

echo "[+] Running basic forensic checks"

echo "\n[+] Listing execution logs"
ls -l /app/logs

echo "\n[+] Showing malware execution log"
cat /app/logs/execution.log

echo "\n[+] Searching for stolen token artifacts"
find /app -name "*token*" -o -name "*cookie*"

echo "\n[+] Done."
