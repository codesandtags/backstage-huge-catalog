#!/bin/bash

# Define the folder containing the structure
folder_path="./centralized"
folder_output="./decentralized/"

# Check if the 'apis' folder exists
# Function to process a folder
process_folder() {
  local folder="$1"

  # Check if the folder exists
  if [ -d "$folder_path/$folder" ]; then
    echo "Found '$folder' folder."

    # Iterate over each file in the folder
    for file in "$folder_path/$folder"/*; do
      if [ -f "$file" ]; then
        echo "File: $file"

        # Extract the filename without the extension
        filename_without_extension=$(basename -- "$file")
        filename_without_extension="${filename_without_extension%.*}"

        # Create a folder with the same name (without extension)
        folder_name="$folder_output$filename_without_extension"
        mkdir -p "$folder_name"

        # Copy the content of the file into the folder with the name 'catalog-info.yaml'
        cp "$file" "$folder_name/catalog-info.yaml"

        echo "Created folder '$folder_name' and copied content to '$folder_name/catalog-info.yaml'"
      fi
    done
  else
    echo "'$folder' folder not found."
  fi
}

# Call the function for each folder
process_folder "apis"
process_folder "components"
process_folder "systems"
process_folder "groups"
process_folder "domains"