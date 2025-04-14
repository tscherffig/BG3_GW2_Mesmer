@echo off
setlocal

REM Determine the directory from which the script is executed
set "current_dir=%cd%"

REM Check if dwebp.exe is available
if not exist "%current_dir%\dwebp.exe" (
    echo dwebp.exe not found in the current directory.
    exit /b
)

REM Check for command line flag for PPM output
set "output_ext=png"
if "%~1" == "-ppm" set "output_ext=ppm"

REM Convert all WEBP files to the specified image format
for %%f in (*.webp) do (
    echo Converting %%f to %%output_ext...
    "%current_dir%\dwebp.exe" "%%f" -o "%%~nf.%output_ext%"
    if errorlevel 1 echo Failed to convert %%f
)

echo Conversion complete.
pause