@echo off
setlocal enabledelayedexpansion

rem Check if two command line arguments are provided
if "%~2"=="" (
    echo Usage: %0 "input_directory" "output_file"
    exit /b 1
)

rem Set the input directory and output file from command-line arguments
set "scan_dir=%~1"
set "output_file=%~2"

rem Clear output file if exists
type nul > "%output_file%"

rem Tools and commands documentation
echo Tools: Exiftool >> "%output_file%"
echo Command: exiftool filename >> "%output_file%"
echo. >> "%output_file%"

rem Save all scanned file metadata to output file
for /r "%scan_dir%" %%x in (*) do (
	echo "%%x" >> "%output_file%"
	exiftool "%%x" >> "%output_file%"
	echo. >> "%output_file%"
)

endlocal