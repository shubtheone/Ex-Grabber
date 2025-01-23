
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
