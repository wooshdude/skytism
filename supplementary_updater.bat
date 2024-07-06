@echo off
setlocal enabledelayedexpansion

REM Check if Git is installed
where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Git is not installed or not in the system PATH.
    echo Please install Git and add it to your system PATH.
    pause
    exit /b 1
)

echo Git is installed and available in the system PATH.

REM Check if current directory is a Git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo The current directory is not a Git repository.
    echo Please make sure your modpack is up to date.
    pause
    exit /b 1
)

echo The current directory is a Git repository.

REM Pull the latest commit from the remote repository
echo Pulling the latest changes from the remote repository...
git pull
if %ERRORLEVEL% neq 0 (
    echo Failed to pull the latest changes.
    echo Please check your internet connection or repository permissions.
    pause
    exit /b 1
)

echo Successfully pulled the latest changes.