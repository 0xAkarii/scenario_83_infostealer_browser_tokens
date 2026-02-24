#!/bin/bash

LOG="/opt/infostealer/execution.log"
NETLOG="/opt/infostealer/network.log"

echo "INFOSTEALER_EXECUTION PHANTOMGRID{infostealer.sh}" >> $LOG
echo "Host=victim-host OS=Linux PHANTOMGRID{victim-host}" >> $LOG
echo "Browser=Chrome Profile=Default" >> $LOG

echo "Login Data accessed PHANTOMGRID{Login_Data}" >> $LOG
echo "Cookies accessed PHANTOMGRID{SESSIONID}" >> $LOG

echo "Token Prefix=ya29 PHANTOMGRID{ya29}" >> $LOG
echo "Service=PhantomMail PHANTOMGRID{PhantomMail}" >> $LOG

echo "Archive created browser_data.tar.gz PHANTOMGRID{browser_data.tar.gz}" >> $LOG

echo "EXFILTRATION_ATTEMPT to 10.10.10.66:9137 PHANTOMGRID{9137}" >> $NETLOG
echo "Protocol=HTTP PHANTOMGRID{HTTP}" >> $NETLOG
echo "C2=fake-c2.local PHANTOMGRID{fake-c2.local}" >> $NETLOG

echo "PERSISTENCE_CRON added PHANTOMGRID{cron_persistence}" >> $LOG

echo "FINAL_STATUS PHANTOMGRID{INFOSTEALER_CONFIRMED}" >> $LOG
echo "COMPLETE PHANTOMGRID{SCENARIO_83_COMPLETE}" >> $LOG