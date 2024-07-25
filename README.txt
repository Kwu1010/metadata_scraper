This program was created for Windows 10

Before use, go into examine.bat and change all <PATH> placeholders to the path where the script files and files to scan are stored
The program is designed to execute where all the script files including exiftool.exe are in the same directory, and the files to scan are stored in Files folder



The metadata extraction program consists of 5 parts excluding exiftool.exe
All batch files, python files, and exiftool.exe should be in the same folder to run this program

examine.bat is the main batch file which runs the program in its entirety
metadata_scan.bat takes a directory path and outputs all filenames and metadata into "t_extracted_metadata.txt" (Section 1)
metadata_parse.py takes "t_extracted_metadata.txt" and generates a UNIQUE list of tags in alphabetical order (Section 2)
metadata_scrub.bat takes a directory path and attempts to scrub its files, printing to "t_scrub_status.txt" (Section 3)

To determine remaining or unchangable Exif tags, the program reruns the metadata scan and tag sort,
outputting to "t_remaining_metadata.txt" and "t_remaining_tags.txt"

metadata_delete_failed.py takes "t_scrub_status.txt" and deletes all files which failed to have metadata scrubbed
This program is run after the scrub program and before the scan rerun to only look at successfully scrubbed files
This program is commented out in examine.bat by default, allowing it to find all remaining metadata