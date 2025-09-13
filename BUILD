###
### ------------------
### Packaging Plan:###
### ------------------
###
1.	Prepare the Directory Structure
o	Create a directory structure for the RPM package.
o	Place the scripts, configuration files, and other necessary files in their respective directories.
2.	Create the Spec File
o	Write an RPM spec file that defines the package metadata, dependencies, files, and post-installation scripts.
3.	Build the RPM Package
o	Use the rpmbuild tool to build the RPM package from the spec file.
4.	Provide Installation Instructions
o	Write detailed instructions on how to install and configure the package on Red Hat 8.


### ------------------
### Directory Structure
### ------------------

	```
	/vulnerability-scanner
	|-- agent-server
	|   |-- config
	|   |   |-- config.json
	|   |-- scripts
	|   |   |-- data_collector.py
	|   |   |-- upload_data.py
	|-- offline-server
	|   |-- config
	|   |   |-- config.json
	|   |-- scripts
	|   |   |-- vulnerability_scanner.py
	|   |   |-- update_vulnerability_db.py
	|   |-- custom_export_tool.py
	|-- packaging
	|   |-- vulnerability-scanner.spec
	|-- requirements.txt
	|-- README.md



mkdir -p vulnerability-scanner/agent-server/config
touch vulnerability-scanner/agent-server/config/config.json
mkdir -p vulnerability-scanner/agent-server/scripts
touch vulnerability-scanner/agent-server/scripts/data_collector.py
touch vulnerability-scanner/agent-server/scripts/upload_data.py
mkdir -p vulnerability-scanner/offline-server/config
touch vulnerability-scanner/offline-server/config/config.json
mkdir -p vulnerability-scanner/offline-server/scripts
touch vulnerability-scanner/offline-server/scripts/vulnerability_scanner.py
touch vulnerability-scanner/offline-server/scripts/update_vulnerability_db.py
touch vulnerability-scanner/offline-server/scripts/custom_export_tool.py
mkdir -p vulnerability-scanner/packaging
touch vulnerability-scanner/packaging/vulnerability-scanner.spec
touch vulnerability-scanner/requirements.txt
touch vulnerability-scanner/README.md



### ------------------
### Build the RPM Package ###
### -------------------------------

1. **Create the Source Archive:**
   ```sh
   tar czf vulnerability-scanner-1.0.tar.gz -C /path/to/vulnerability-scanner .
   ```

2. **Build the RPM:**
   ```sh
   rpmbuild -ba packaging/vulnerability-scanner.spec
   ```
###
### Installation Instructions
### ------------------------------###

1. **Install the RPM Package:**
   ```sh
   sudo rpm -ivh /path/to/vulnerability-scanner-1.0-1.noarch.rpm
   ```

2. **Configure the Application:**
   - Edit the configuration file `/usr/local/vulnerability-scanner/agent-server/config/config.json` to set the appropriate values for `passphrase`, `server_url`, `nvd_url`, and `rhsa_url`.

3. **Update the Vulnerability Database:**
   ```sh
   sudo python3 /usr/local/vulnerability-scanner/offline-server/scripts/update_vulnerability_db.py
   ```

4. **Run the Data Collector:**
   ```sh
   sudo python3 /usr/local/vulnerability-scanner/agent-server/scripts/data_collector.py
   ```

5. **Upload Collected Data:**
   ```sh
   sudo python3 /usr/local/vulnerability-scanner/agent-server/scripts/upload_data.py
   ```

6. **Run the Vulnerability Scanner:**
   ```sh
   sudo python3 /usr/local/vulnerability-scanner/offline-server/scripts/vulnerability_scanner.py
   ```


