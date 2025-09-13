#!/bin/bash
# build_rpm.sh

# Variables
NAME="my_project"  # Replace with your project name
VERSION="1.0.0"    # Replace with your project version
RELEASE="1"
ARCH="noarch"
BUILD_DIR=$(pwd)/rpmbuild
SPEC_FILE=${BUILD_DIR}/SPECS/${NAME}.spec

# Create RPM build directories
echo "Setting up RPM build environment..."
mkdir -p ${BUILD_DIR}/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

# Copy project files to SOURCES
echo "Copying project files..."
tar -czvf ${BUILD_DIR}/SOURCES/${NAME}-${VERSION}.tar.gz --exclude="${BUILD_DIR}" *

# Create SPEC file
echo "Creating SPEC file..."
cat <<EOF > ${SPEC_FILE}
Name: ${NAME}
Version: ${VERSION}
Release: ${RELEASE}
Summary: My Project

License: GPL
Source0: %{name}-%{version}.tar.gz

BuildArch: ${ARCH}
BuildRoot: %{_tmppath}/%{name}-%{version}-build

%description
My project description.

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}/usr/local/bin
cp -r agent_server offline_server %{buildroot}/usr/local/bin

%files
/usr/local/bin/agent_server
/usr/local/bin/offline_server

%changelog
* $(date "+%a %b %d %Y") Your Name <you@example.com> - ${VERSION}-${RELEASE}
- Initial RPM release
EOF

# Build RPM
echo "Building RPM..."
rpmbuild -ba ${SPEC_FILE} --define "_topdir ${BUILD_DIR}"

echo "RPM build complete. You can find it in ${BUILD_DIR}/RPMS/${ARCH}/"

