
# Satark — Offline Vulnerability Scanning (Agent ↔ Offline Server)

Satark collects system/package integrity data **on production hosts** (Agent), encrypts and ships it to a protected **Offline Server** which correlates against **NVD** / **RHSA** and can export **OpenSCAP-compatible** outputs.

- Agent: RHEL 8+ focused; systemd-managed; configurable windows; load-aware; modular collectors.
- Offline Server: Flask + PAM auth; per-user upload areas; local vuln DB (NVD/RHSA); reports (HTML/XCCDF).

# Vulnerability Scanner

This package contains an offline vulnerability scanner that collects system data, encrypts, archives, and sends it to an offline server for analysis. It integrates with a vulnerability database to identify potential vulnerabilities in the collected data.

## Installation

1. Install the RPM package:
   ```sh
   sudo rpm -ivh /path/to/vulnerability-scanner-1.0-1.noarch.rpm



## Usage

    Run the Data Collector:

   ```sh
	source /usr/local/vulnerability-scanner/venv/bin/activate
	python /usr/local/vulnerability-scanner/agent-server/scripts/data_collector.py
	deactivate

    Upload Collected Data:

   ```sh
	source /usr/local/vulnerability-scanner/venv/bin/activate
	python /usr/local/vulnerability-scanner/agent-server/scripts/upload_data.py
	deactivate

    Run the Vulnerability Scanner:

   ```sh
	source /usr/local/vulnerability-scanner/venv/bin/activate
	python /usr/local/vulnerability-scanner/offline-server/scripts/vulnerability_scanner.py
	deactivate

# License

This project is licensed under the MIT License.

# Explanation of third party packages used

    Flask: Used for the Flask application to receive archives via HTTPS.
    requests: For making HTTP requests, especially for sending data from the Agent Server to the Offline Server and downloading vulnerability data.
    cryptography: Provides cryptographic recipes and primitives to help developers implement strong encryption in their applications.
    pyOpenSSL: Used to interface with OpenSSL for encryption/decryption tasks.
    jsonschema: Useful for validating JSON data structures, ensuring they meet predefined schemas.
    Jinja2: A templating engine for Python, used here for generating HTML reports.
    zipfile36: Used for handling zip archives in Python.
    python-dateutil: Adds support for parsing and manipulating dates, often required when handling time-stamped data.
    psutil: A cross-platform library for retrieving information on running processes and system utilization, used for capturing system activity.
    pdfkit: Converts HTML reports to PDF, if you decide to use PDF reports.
    lxml: A library for processing XML and HTML, useful for parsing and extracting data when needed.


# Source Information

Makefile: A file to manage build commands for building the RPM, setting up the virtual environment, and installing dependencies.
Build Script: A shell script to create the RPM build environment and package the project.
Python Virtual Environment (venv) Script: A shell script to create a Python virtual environment and install required dependencies.

### ------------------
### Summary
### ------------------
###
### Agent Server:
###         collect_data.py: Collects system data and saves it into JSON files.
###         encrypt_data.py: Encrypts JSON files using OpenSSL.
###         archive_data.py: Archives the encrypted files into a single zip file.
###         send_data.py: Sends the archive to the Offline Server using HTTPS.
###         run_agent.py: Main script to execute all the above steps sequentially.
###
## This agent server must be inteligent to take care about the folliwng thinsg
## Createa  cron jon based on the configuration avaiable when to run.Here run should be 
## schedule time means between some x to y. In that x to y this service should intelligently finish the above tasks
## check a load and run with low priority
## 

###
### Offline Server:
###         app.py: Flask application to receive archives via HTTPS.
###         decrypt_data.py: Decrypts the received archive.
###         extract_data.py: Extracts the decrypted archive.
###         vulnerability_scanner.py: Performs vulnerability scanning using the extracted data and a vulnerability database. Reads the merged vulnerability database and compares the collected package information against the known vulnerabilities.
###         generate_reports.py: Generates an HTML report from the scanning results.
###         convert_reports.py: Converts the HTML report into an OpenSCAP compatible format.
###         update_vulnerability_db.py: Downloads the latest NVD and RHSA vulnerability data, extracts it, and merges it into a single JSON file.
###         config.json: Stores URLs for downloading the vulnerability databases and other configuration settings.
###
### Vulnerability Database:
###         config/vulnerability_db/: Directory to store vulnerability database files.
###
### Custom Export Tool:
###         convert_reports.py: Script to convert generated reports into OpenSCAP format using xsltproc.
###
###
### ------------------
### Key Considerations Implemented
### ------------------
### 1. **Error Handling**: Added try-except blocks and subprocess error handling.
### 2. **Configuration Management**: Configurations stored in `config/config.json`.
### 3. **Data Validation**: Not explicitly added but assumed by correctly parsing and processing JSON data.
### 4. **Security**: Encryption of data using OpenSSL, HTTPS for data transfer.
### 5. **Performance Optimization**: Optimized data processing and error handling.
###
### ------------------
### Next Steps
### ------------------
### 1. Thoroughly test the entire system.
### 2. Integrate actual vulnerability databases.
### 3. Fine-tune error handling and security measures.
### 4. Add authentication and authorization mechanisms.
###


## Quick Start

```bash
# 0) clone & enter
git clone https://github.com/venkataenumula/satark.git
cd satark

# 1) create venv and install deps
./setup_venv.sh
source .venv/bin/activate
pip install -r requirements.txt

# 2) generate skeleton (safe to re-run)
./setup_project_structure.sh

# 3) configure
$EDITOR satark/resources/config/agent/config.json
$EDITOR satark/resources/config/server/config.json

# 4) run agent once (foreground)
python satark/agent_server/scripts/run_agent.py

# 5) run offline server (dev)
FLASK_APP=satark/offline_server/app/app.py flask run --host 0.0.0.0 --port 5000

For RPM packaging & systemd, see INSTALL.md. For architecture details, see DESIGN.md.


