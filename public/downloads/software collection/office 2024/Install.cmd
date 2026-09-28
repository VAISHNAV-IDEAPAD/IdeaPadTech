@echo off
setlocal
cd /d "%~dp0"

:: Check for administrative rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrative rights required. Requesting elevation...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

title Installing Microsoft Office (Excel)
echo ========================================================
echo       Starting Microsoft Office 2024 Setup...
echo ========================================================
echo.
echo Installing components configured in Config.xml (Excel)...
echo Please do not close this window until setup finishes.
echo.

"%~dp0setup.exe" /configure "%~dp0Config.xml"

if %errorLevel% equ 0 (
    echo.
    echo ========================================================
    echo         Installation completed successfully!
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo         Setup finished with exit code: %errorLevel%
    echo ========================================================
)

echo.
pause
