#!/bin/bash

# Function to create directory and placeholder files
create_dir_and_files() {
    local dir_path=$1
    shift
    local files=("$@")
    
    mkdir -p "$dir_path"
    for file in "${files[@]}"; do
        touch "$dir_path/$file"
    done
}

# Main directories for the Agent Server
agent_server_dirs=(
    "agent_server"
    "agent_server/scripts"
    "agent_server/data"
    "agent_server/encrypted_data"
    "agent_server/archives"
)

# Files for the Agent Server
agent_server_files=(
    "scripts/collect_system_data.py"
    "scripts/collect_package_data.py"
    "scripts/collect_aide_data.py"
    "scripts/collect_sa_data.py"
    "scripts/encrypt_data.py"
    "scripts/archive_data.py"
    "scripts/send_data.py"
    "scripts/run_agent.py"
    "data/system_data.json"
    "data/package_data.json"
    "data/aide_data.json"
    "data/sa_data.json"
    "encrypted_data/system_data.json.enc"
    "encrypted_data/package_data.json.enc"
    "encrypted_data/aide_data.json.enc"
    "encrypted_data/sa_data.json.enc"
    "archives/collected_data.zip"
)

# Main directories for the Offline Server
offline_server_dirs=(
    "offline_server"
    "offline_server/app"
    "offline_server/scripts"
    "offline_server/data"
    "offline_server/reports"
    "offline_server/config"
    "offline_server/vulnerability_db"
)

# Files for the Offline Server
offline_server_files=(
    "app/app.py"
    "scripts/decrypt_data.py"
    "scripts/extract_data.py"
    "scripts/vulnerability_scanner.py"
    "scripts/generate_reports.py"
    "scripts/convert_reports.py"
    "scripts/update_vulnerability_db.py"
    "config/config.json"
    "data/received_archive.zip"
    "data/decrypted_data"
    "reports/scanning_results.html"
    "vulnerability_db/nvdcve-1.1-modified.json"
    "vulnerability_db/rhsa.json"
)

# Create directories and files for the Agent Server
echo "Creating Agent Server directory structure..."
for dir in "${agent_server_dirs[@]}"; do
    create_dir_and_files "$dir"
done

for file in "${agent_server_files[@]}"; do
    touch "agent_server/$file"
done

# Create directories and files for the Offline Server
echo "Creating Offline Server directory structure..."
for dir in "${offline_server_dirs[@]}"; do
    create_dir_and_files "$dir"
done

for file in "${offline_server_files[@]}"; do
    touch "offline_server/$file"
done

echo "Project setup complete."

