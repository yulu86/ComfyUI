@echo off
setlocal enabledelayedexpansion

set PROPERTIES_FILE=custom_nodes
set DESTINATION_FOLDER=../custom_nodes

for /f "tokens=1,* delims==" %%a in ('type "%PROPERTIES_FILE%" ^| findstr /v "^#" ^| findstr "="') do (
    set "project_name=%%a"
    set "git_path=%%b"
    set "proxy_git_path=https://gh-proxy.com/!git_path!"

    if not exist "%DESTINATION_FOLDER%\!project_name!\" (
        echo Cloning project !project_name! from !git_path!...
        git clone !proxy_git_path! "%DESTINATION_FOLDER%\!project_name!" --recursive
        if exist "%DESTINATION_FOLDER%\!project_name!\requirements.txt" (
          python -m pip install -r "%DESTINATION_FOLDER%\!project_name!\requirements.txt"
        )
    ) else (
        echo Project already exists. Skipping clone. Project Name: !project_name! 
    )    
)

endlocal
