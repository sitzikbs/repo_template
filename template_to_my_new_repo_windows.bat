@echo off
REM template_to_my_new_repo.bat
REM Usage: template_to_my_new_repo.bat <new_project_name> [<remote_repo_url>]
REM This script clones the current template repo to a new directory, removes git history,
REM initializes a new git repo, and optionally sets a new remote.

SETLOCAL ENABLEDELAYEDEXPANSION

IF "%~1"=="" (
    echo Usage: %~nx0 ^<new_project_name^> [^<remote_repo_url^>]
    echo 📦 Usage: %~nx0 ^<new_project_name^> [^<remote_repo_url^>]
    EXIT /B 1
)

SET "NEW_NAME=%~1"
SET "REMOTE_URL=%~2"
SET "TEMPLATE_DIR=%CD%"

REM Create the new project directory one level up from the template
FOR %%I IN ("%TEMPLATE_DIR%") DO SET "PARENT_DIR=%%~dpI"
SET "PARENT_DIR=%PARENT_DIR:~0,-1%"
SET "NEW_PATH=%PARENT_DIR%\%NEW_NAME%"

IF EXIST "%NEW_PATH%" (
    echo Directory %NEW_PATH% already exists.
    EXIT /B 1
)

mkdir "%NEW_PATH%"
robocopy "%TEMPLATE_DIR%" "%NEW_PATH%" /E /XD .git >nul
cd /d "%NEW_PATH%"

REM Copy .env.example to .env if it exists
IF EXIST .env.example (
    move /Y .env.example .env >nul
    echo .env.example moved to .env. Please update values as needed.
)

REM Remove existing git history
IF EXIST .git rmdir /S /Q .git

git init
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
echo Initialized new git repository in %NEW_NAME%.
echo ✅ Initialized new git repository in %NEW_NAME%.

IF NOT "%REMOTE_URL%"=="" (
    git remote add origin "%REMOTE_URL%"
    if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
    echo 🔗 Added remote: %REMOTE_URL%
)

git add .
git commit -m "feat: initial commit from template"

if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
echo Project %NEW_NAME% is ready.
echo 🎉 Project %NEW_NAME% is ready!

echo.
echo Next steps:
echo - Update project details in pyproject.toml, README.md, etc.
echo - Replace placeholder values in .env and other config files.
echo - (Optional) Push to remote: git push -u origin main
