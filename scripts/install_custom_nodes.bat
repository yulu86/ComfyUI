@echo off
setlocal enabledelayedexpansion

set PROPERTIES_FILE=custom_nodes
set DESTINATION_FOLDER=../custom_nodes

for /f "tokens=1,* delims==" %%a in ('type "%PROPERTIES_FILE%" ^| findstr /v "^#" ^| findstr "="') do (
    set "project_name=%%a"
    set "git_path=%%b"

    if not exist "%DESTINATION_FOLDER%\!project_name!\" (
        echo Cloning project !project_name! from !git_path!...
        git clone !git_path! "%DESTINATION_FOLDER%\!project_name!" --recursive
    ) else (
        echo Project already exists. Update project Name: !project_name!
        git --git-dir=%DESTINATION_FOLDER%\!project_name!/.git --work-tree=%DESTINATION_FOLDER%\!project_name! pull
        @REM git --git-dir=%DESTINATION_FOLDER%\!project_name!/.git --work-tree=%DESTINATION_FOLDER%\!project_name! remote set-url origin !git_path!
    )

    call :install_requirements "%DESTINATION_FOLDER%\!project_name!"
)

endlocal
exit /b

:install_requirements
if exist "%~1\requirements.txt" (
    python -m pip install -r "%~1\requirements.txt"
    echo install requirements.txt done
) else (
    echo No requirements.txt found in %~1
)
exit /b 0