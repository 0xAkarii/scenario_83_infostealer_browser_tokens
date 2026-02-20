import json
import base64

INPUT = "../victim/artifacts/stolen_tokens.json"

with open(INPUT) as f:
    data = json.load(f)

print("[+] Token Analysis Report")
print("=========================")

for cookie in data.get("cookies", []):
    print(f"Cookie Name : {cookie['name']}")
    print(f"Domain      : {cookie['domain']}")
    print(f"Value (truncated): {cookie['value'][:20]}...")

for token in data.get("oauth_tokens", []):
    print(f"\nService : {token['service']}")
    print(f"Token Prefix : {token['token'].split('.')[0]}")
    print("Risk : Session Hijacking / Account Takeover")
