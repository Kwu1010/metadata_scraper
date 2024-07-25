import os
import sys

# This script is used to delete all the files that failed to extract metadata
def main():
    # Check for correct number of arguments
    if len(sys.argv) != 3:
        print('Usage: metadata_parse.py <file_path> <input_file>')
        sys.exit(1)

    # Get file path and input filename
    file_path = sys.argv[1]
    input_filename = sys.argv[2]
    failed_files = []

    # Open input file and read lines
    input_filename = open(input_filename, 'r')
    lines = input_filename.readlines()
    temp_path = ''
    for line in lines:
        if line[0] == '"':
            temp_path = line
        else:
            strip_line = line.strip()
            if (len(strip_line) > 0) and (strip_line[0] == '0'):
                failed_files.append(temp_path)
    input_filename.close()
    print(failed_files)

    # Delete failed files, failed files contain the path to the file
    # like "C:\\Users\\Name\\Code\\Exiftool\\Files\\allfiles\\First.png"
    for file in failed_files:
        file = file.strip()
        command = 'del ' + file
        os.system(command)

if __name__ == '__main__':
    main()