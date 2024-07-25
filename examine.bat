@echo off
setlocal enabledelayedexpansion

rem examine.bat scans all files in a directory and prints it to a file, parses the scanned metadata for a sorted list of tags, and attempts to scrub the metadata from the files
rem examine.bat uses metadata_scan.bat, metadata_parse.py, and metadata_scrub.bat

rem Set to directory of the script files
cd "C:\Users\Kevin\Code\exiftool_scripts"

rem Set to the directory of the files to scan
set "input_dir=C:\Users\Kevin\Code\exiftool_scripts\Files"

rem Set to the directory of the script files
set "metadata_file=C:\Users\Kevin\Code\exiftool_scripts\t_extracted_metadata.txt"
set "metadata_tags=C:\Users\Kevin\Code\exiftool_scripts\t_extracted_tags.txt"
set "scrub_status=C:\Users\Kevin\Code\exiftool_scripts\t_scrub_status.txt"
set "scrub_metadata=C:\Users\Kevin\Code\exiftool_scripts\t_remaining_metadata.txt"
set "scrub_tags=C:\Users\Kevin\Code\exiftool_scripts\t_remaining_tags.txt"

rem Run metadata scan
call metadata_scan.bat "%input_dir%" "%metadata_file%"

rem Sort extracted metadata tags
python metadata_parse.py "%metadata_file%" "%metadata_tags%"

rem Scrub metadata of all files
rem call metadata_scrub.bat "%input_dir%" "%scrub_status%"

rem Delete files that failed to be scrubbed
rem python metadata_delete_failed.py "%input_dir%" "%scrub_status%"

rem Run metadata scan for remaining tags and sort them
rem call metadata_scan.bat "%input_dir%" "%scrub_metadata%"
rem python metadata_parse.py "%scrub_metadata%" "%scrub_tags%"

endlocal