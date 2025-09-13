#!/bin/bash
# setup_venv.sh

# Variables
VENV_DIR="venv"

# Create virtual environment
echo "Creating virtual environment in ${VENV_DIR}..."
python3 -m venv ${VENV_DIR}

# Activate virtual environment
echo "Activating virtual environment..."
source ${VENV_DIR}/bin/activate

# Install dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
else
    echo "No requirements.txt found. Skipping dependency installation."
fi

echo "Virtual environment setup complete."
