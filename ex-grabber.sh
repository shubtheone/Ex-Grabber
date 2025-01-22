#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD_CYAN='\033[1;36m
NC='\033[0m' # No Color


# Banner
banner() {
    echo -e "${BOLD_CYAN}"
    cat << "EOF"
░█▀▀▀ █─█ ── ░█▀▀█ █▀▀█ █▀▀█ █▀▀▄ █▀▀▄ █▀▀ █▀▀█ 
░█▀▀▀ ▄▀▄ ▀▀ ░█─▄▄ █▄▄▀ █▄▄█ █▀▀▄ █▀▀▄ █▀▀ █▄▄▀ 
░█▄▄▄ ▀─▀ ── ░█▄▄█ ▀─▀▀ ▀──▀ ▀▀▀─ ▀▀▀─ ▀▀▀ ▀─▀▀
EOF
    echo -e "${GREEN}Made by blackthorns (@shubtheone)${NC}"
    echo -e "${GREEN}Ex-Grabber: Extension Extraction Tool${NC}"
}

# Main menu function
main_menu() {
    echo -e "${YELLOW}Select an extension category:${NC}"
    echo "1. Office Documents (doc, xls, xlsx, pdf, ppt)"
    echo "2. Database and Compressed Files (db, zip)"
    echo "3. System and Config Files"
    echo "4. Development and Source Files"
    echo "5. Custom Extension Search"
    echo "6. Exit"
}

# Office Documents search
office_docs_search() {
    local file=$1
    echo -e "${GREEN}Searching for Office Documents...${NC}"
    grep -E '\.(doc|xls|xlsx|pdf|ppt|docx|pptx)$' "$file"
}

# Database and Compressed Files search
db_compressed_search() {
    local file=$1
    echo -e "${GREEN}Searching for Database and Compressed Files...${NC}"
    grep -E '\.(db|zip|7z|rar|tar\.gz|tgz|backup)$' "$file"
}

# System and Config Files search
system_config_search() {
    local file=$1
    echo -e "${GREEN}Searching for System and Config Files...${NC}"
    grep -E '\.(yml|yaml|config|ini|log|tmp|cache|bak)$' "$file"
}

# Development and Source Files search
dev_source_search() {
    local file=$1
    echo -e "${GREEN}Searching for Development and Source Files...${NC}"
    grep -E '\.(py|js|html|css|json|xml|sh|bat|bin|exe)$' "$file"
}

# Custom extension search
custom_search() {
    local file=$1
    read -p "Enter your custom extension pattern (e.g., \.pdf|\.xls): " pattern
    echo -e "${GREEN}Searching with custom pattern: $pattern${NC}"
    grep -E "$pattern" "$file"
}

# Main script
main() {
    clear
    banner

    # Prompt for file input
    read -p "Enter path to output file: " input_file

    # Validate file
    if [ ! -f "$input_file" ]; then
        echo -e "${RED}Error: File not found!${NC}"
        exit 1
    fi

    while true; do
        main_menu
        read -p "Enter your choice: " choice

        case $choice in
            1) office_docs_search "$input_file" ;;
            2) db_compressed_search "$input_file" ;;
            3) system_config_search "$input_file" ;;
            4) dev_source_search "$input_file" ;;
            5) custom_search "$input_file" ;;
            6) 
                echo -e "${YELLOW}Exiting...${NC}"
                exit 0 
                ;;
            *) 
                echo -e "${RED}Invalid choice. Please try again.${NC}"
                ;;
        esac

        read -p "Press Enter to continue..." pause
        clear
        banner
    done
}

# Run the script
main
