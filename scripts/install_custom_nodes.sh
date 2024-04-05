#!/bin/bash

PROPERTIES_FILE="custom_nodes"
DESTINATION_FOLDER="../custom_nodes"

while IFS="=" read -r project_name git_path || [[ -n "$project_name" && -n "$git_path" ]]; do
    if [[ $project_name == \#* ]]; then
        continue
    fi

    proxy_git_path="https://gh-proxy.com/$git_path"    

    if [ ! -d "$DESTINATION_FOLDER/$project_name" ]; then
        echo "Cloning project $project_name from $git_path..."
        git clone "$proxy_git_path" "$DESTINATION_FOLDER/$project_name"
        if [ -d "$DESTINATION_FOLDER/$project_name/requirements.txt" ]; then
            python3 -m pip install -r "$DESTINATION_FOLDER/$project_name/requirements.txt"
        fi
    else
        echo "Project already exists. Update project Name: $project_name"
        git --git-dir="$DESTINATION_FOLDER/$project_name/.git" --work-tree="$DESTINATION_FOLDER/$project_name" pull
        if [ -d "$DESTINATION_FOLDER/$project_name/requirements.txt" ]; then
            python3 -m pip install -r "$DESTINATION_FOLDER/$project_name/requirements.txt" 
        fi
    fi
done < "$PROPERTIES_FILE"
