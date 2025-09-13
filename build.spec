Name: vulnerability-scanner
Version: 1.0
Release: 1%{?dist}
Summary: Offline Vulnerability Scanner for Red Hat 8

License: MIT
URL: http://example.com
Source0: %{name}-%{version}.tar.gz

BuildArch: noarch
Requires: python3, openssl

%description
This package contains an offline vulnerability scanner that collects system data, encrypts, archives, and sends it to an offline server for analysis. It integrates with a vulnerability database to identify potential vulnerabilities in the collected data.

%prep
%setup -q

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/local/vulnerability-scanner
cp -r agent-server offline-server requirements.txt $RPM_BUILD_ROOT/usr/local/vulnerability-scanner

# Set up the Python virtual environment
python3 -m venv $RPM_BUILD_ROOT/usr/local/vulnerability-scanner/venv
source $RPM_BUILD_ROOT/usr/local/vulnerability-scanner/venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate

%files
/usr/local/vulnerability-scanner/agent-server/config/config.json
/usr/local/vulnerability-scanner/agent-server/scripts/data_collector.py
/usr/local/vulnerability-scanner/agent-server/scripts/upload_data.py
/usr/local/vulnerability-scanner/offline-server/config/config.json
/usr/local/vulnerability-scanner/offline-server/scripts/vulnerability_scanner.py
/usr/local/vulnerability-scanner/offline-server/scripts/update_vulnerability_db.py
/usr/local/vulnerability-scanner/offline-server/custom_export_tool.py
/usr/local/vulnerability-scanner/requirements.txt
/usr/local/vulnerability-scanner/venv

%post
echo "Vulnerability Scanner installed successfully."
echo "Please configure the application by editing the config files in /usr/local/vulnerability-scanner."

%changelog
* Tue Aug 06 2024 Venkata Enumula <venkata@example.com> - 1.0-1
- Initial package creation

