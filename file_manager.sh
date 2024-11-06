#!/bin/bash
# File Manager Script
# Display menu
function display_menu() {
  echo "Simple File Manager"
  echo "1. Create a Directory"
  echo "2. Change Directory"
  echo "3. List Files"
  echo "4. Search for a File"
  echo "5. Copy File"
  echo "6. Move File"
  echo "7. Delete File"
  echo "8. Display File Content"
  echo "9. Show File Metadata"
  echo "10. Add a File in Directory"
  echo "11. Delete Directory"
  echo "12. Write to File"
  echo "13. Exit"
  echo "Enter your choice: "
}

# Create a directory
function create_directory() {
  read -p "Enter directory name: " dir_name
  mkdir "$dir_name" && echo "Directory '$dir_name' created." || echo "Failed to create directory."
}

# Change directory
function change_directory() {
  read -p "Enter directory path: " dir_path
  cd "$dir_path" && echo "Changed directory to '$dir_path'." || echo "Failed to change directory."
}

# List files
function list_files() {
  ls -la
}

# Search for a file
function search_file() {
  read -p "Enter filename to search: " filename
  find . -name "$filename"
}

# Copy file
function copy_file() {
  read -p "Enter source file: " src
  read -p "Enter destination: " dest
  cp "$src" "$dest" && echo "File copied to '$dest'." || echo "Failed to copy file."
}

# Move file
function move_file() {
  read -p "Enter file to move: " file
  read -p "Enter destination: " dest
  mv "$file" "$dest" && echo "File moved to '$dest'." || echo "Failed to move file."
}

# Delete file
function delete_file() {
  read -p "Enter file to delete: " file
  rm "$file" && echo "File deleted." || echo "Failed to delete file."
}

# Display file content
function display_content() {
  read -p "Enter filename to display: " filename
  cat "$filename"
}

# Show file metadata
function show_metadata() {
  read -p "Enter filename for metadata: " filename
  stat "$filename"
}

# Add a file in a directory
function add_file_in_directory() {
  read -p "Enter directory path: " dir_path
  read -p "Enter file name to create: " file_name
  touch "$dir_path/$file_name" && echo "File '$file_name' created in '$dir_path'." || echo "Failed to create file."
}

# Delete a directory
function delete_directory() {
  read -p "Enter directory name to delete: " dir_name
  rm -r "$dir_name" && echo "Directory '$dir_name' deleted." || echo "Failed to delete directory."
}

# Write content to a file
function write_to_file() {
  read -p "Enter file name to write to: " file_name
  echo "Enter the content you want to write (press Ctrl+D when done):"
  cat > "$file_name" && echo "Content written to '$file_name'." || echo "Failed to write to file."
}
# Main program loop
while true; do
  display_menu
  read choice
  case $choice in
    1) create_directory ;;
    2) change_directory ;;
    3) list_files ;;
    4) search_file ;;
    5) copy_file ;;
    6) move_file ;;
    7) delete_file ;;
    8) display_content ;;
    9) show_metadata ;;
    10) add_file_in_directory ;;
    11) delete_directory ;;
    12) write_to_file ;;
    13) echo "Exiting."; break ;;
    *) echo "Invalid choice." ;;
  esac
done
