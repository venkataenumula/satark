---

## 4) `DESIGN.md`

```markdown
# Design

## Goals
- No invasive scanners on prod
- Encrypted transfer; offline analysis
- Standards alignment: NVD, RHSA, OpenSCAP (XCCDF/OVAL)

## Components
- Agent (prod): collectors (system, packages, AIDE, SAR, optional sosreport), encrypt → archive → checksum → upload
- Offline Server (protected): receive → decrypt → extract → analyze (NVD/RHSA, oscap) → report (HTML/XCCDF)

## Data flow
1. Agent: collect JSONs → OpenSSL (AES-256-CBC, SHA-256 KDF) → ZIP → SHA256 checksum → HTTPS upload (auth)
2. Offline: receive → verify checksum → decrypt/extract → correlate packages vs NVD/RHSA → render reports → optional XCCDF

## Scheduling & load
- `run_agent.py` runs daemon-style:
  - time window: `start_time`~`end_time`
  - load-aware via 1-min average
  - dependency graph enforced (collect → encrypt → archive → send)

## Security
- PAM auth on offline GUI, user home as root for uploads/reports
- TLS on upload API
- Rotating logs
- Configurable: keyfile/passphrase; token/basic auth to server

## Extensibility
- Add new collectors in `agent_server/scripts`
- Add new outputs/exporters in `offline_server/scripts`
