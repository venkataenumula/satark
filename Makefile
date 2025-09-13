# Makefile

#.PHONY: all clean venv build install-rpm


VENV?=.venv
PY?=$(VENV)/bin/python

.PHONY: venv install lint fmt test run-agent run-offline

# Default target
all: venv build

# Create Python virtual environment and install dependencies
venv:
	@echo "Creating virtual environment..."
	@./scripts/setup_venv.sh

# Build the RPM package
build:
	@echo "Building RPM package..."
	@./scripts/build_rpm.sh

# Install the RPM package
install-rpm:
	@echo "Installing RPM package..."
	sudo rpm -Uvh rpmbuild/RPMS/noarch/*.rpm

# Clean up build artifacts
clean:
	@echo "Cleaning up..."
	@rm -rf build dist *.egg-info
	@rm -rf rpmbuild


venv_p:
	python3 -m venv $(VENV)
install: venv_p
	$(PY) -m pip install -U pip
	$(PY) -m pip install -r requirements.txt

lint:
	$(PY) -m flake8 satark

fmt:
	$(PY) -m black satark

test:
	$(PY) -m pytest -q

run-agent:
	$(PY) satark/agent_server/scripts/run_agent.py

run-offline:
	FLASK_APP=satark/offline_server/app/app.py $(PY) -m flask run -h 0.0.0.0 -p 5000
