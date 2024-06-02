#!/bin/bash

PROPERTIES_FILE="custom_nodes"
DESTINATION_FOLDER="../custom_nodes"

install_requirements() {
    if [ -d "$1/requirements.txt" ]; then
        python3 -m pip install -r "$1/requirements.txt"
    fi
}

update_or_clone_project(){
    local project=$1
    local path=$2

    if [ ! -d "$DESTINATION_FOLDER/$project" ]; then
        echo "Cloning project $project from $path..."
        git clone --depth 1 "$path" "$DESTINATION_FOLDER/$project"
    else
        echo "Project already exists. Updating project Name: $project"
        git --git-dir="$DESTINATION_FOLDER/$project/.git" --work-tree="$DESTINATION_FOLDER/$project" pull
    fi

    install_requirements "$DESTINATION_FOLDER/$project"
}

while IFS="=" read -r project_name git_path || [[ -n "$project_name" && -n "$git_path" ]]; do
    if [[ $project_name == \#* ]]; then
        continue
    fi

    update_or_clone_project "$project_name" "$git_path"
done < "$PROPERTIES_FILE"