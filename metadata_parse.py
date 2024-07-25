import sys

# This script is used to sort and list all the tags from the extracted metadata
def main():
    # Check for correct number of arguments
    if len(sys.argv) != 3:
        print('Usage: metadata_parse.py <input_file> <output_file>')
        sys.exit(1)

    # Get input and output filenames
    input_filename = sys.argv[1]
    output_filename = sys.argv[2]
    tags = []

    # Open input file and read lines
    input_filename = open(input_filename, 'r')
    lines = input_filename.readlines()
    for line in lines:
        if line[0] == '"' or line[0] == '\n' or line[0] == ' ' or line[0] == '\t':
            continue
        else:
            tag = line[:line.index(':')]
            if tag == "Command" or tag == "Tools":
                continue
            if tag not in tags:
                tags.append(tag)
    input_filename.close()

    # Sort tags alphabetically
    tags = sorted(tags)

    # Write tags to output file
    output_filename = open(output_filename, 'w')
    for tag in tags:
        output_filename.write(tag + '\n')

if __name__ == '__main__':
    main()