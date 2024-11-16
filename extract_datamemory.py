import re

def extract_datamemory(input_file, output_file):
    """
    Extracts all 8-digit hexadecimal strings from the input file and writes them to the output file.
    
    :param input_file: Path to the input text file.
    :param output_file: Path to the output text file where extracted hex strings will be saved.
    """
    # Regular expression pattern to match exactly 8 hexadecimal digits
    hex_pattern = re.compile(r'\b[0-9a-fA-F]{8}\b')

    extracted_hex = []

    try:
        with open(input_file, 'r') as infile:
            for line_number, line in enumerate(infile, 1):
                # Find all matches in the current line
                matches = hex_pattern.findall(line)
                if matches:
                    print(f"Line {line_number}: {matches}")
                    extracted_hex.extend(matches)
        
        if extracted_hex:
            with open(output_file, 'w') as outfile:
                for hex_str in extracted_hex:
                    outfile.write(hex_str + '\n')
            print(f"Extraction complete. {len(extracted_hex)} hex values written to '{output_file}'.")
        else:
            print("No 8-digit hexadecimal strings found in the input file.")

    except FileNotFoundError:
        print(f"Error: The file '{input_file}' does not exist.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Define your input and output file paths
    input_filepath = '/home/saad/Desktop/5stagepipeline/output_log.txt'    # Replace with your actual input file path
    output_filepath = 'datamemory.signature'  # Replace with your desired output file path

    extract_datamemory(input_filepath, output_filepath)
