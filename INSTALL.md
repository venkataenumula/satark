
## 3) `INSTALL.md`

```markdown
# Install & Operate

## Prereqs (RHEL 8+)
- python3.9+
- openssl, sos, aide, sar (sysstat)
- git, gcc, make (for building)
- optional: nginx (reverse proxy), podman/docker (containerized offline server)

## Agent install (systemd)
```bash
./setup_venv.sh && source .venv/bin/activate && pip install -r requirements.txt
sudo cp satark/agent_server/agent_server.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now agent-server
sudo systemctl status agent-server

Logs default to /var/log/satark.log (configured by satark/common/logging.json).

Offline server

Edit satark/resources/config/server/config.json

Start with Flask dev server (or WSGI behind nginx):
source .venv/bin/activate
FLASK_APP=satark/offline_server/app/app.py flask run -h 0.0.0.0 -p 5000

Packaging (RPM)
./build_rpm.sh
rpm -Uvh BUILD/RPMS/x86_64/satark-*.rpm
Uninstall
sudo systemctl disable --now agent-server
sudo rm -f /etc/systemd/system/agent-server.service
sudo systemctl daemon-reload
