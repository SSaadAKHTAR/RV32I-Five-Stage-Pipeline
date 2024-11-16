import os
import re
import shutil
import subprocess

class RunTestGetSig:
    
    def __init__(self,ins) -> None:
        
    
    # Define the list of instructions
    instructions = [
        "add-01.S", "beq-01.S", "bne-01.S", "lbu-align-01.S", "misalign1-jalr-01.S",
        "sll-01.S", "sltu-01.S", "sub-01.S", "addi-01.S", "bge-01.S", "fence-01.S",
        "lh-align-01.S", "or-01.S", "slli-01.S", "sra-01.S", "sw-align-01.S", "and-01.S",
        "bgeu-01.S", "jal-01.S", "lhu-align-01.S", "ori-01.S", "slt-01.S", "srai-01.S",
        "xor-01.S", "andi-01.S", "blt-01.S", "jalr-01.S", "lui-01.S", "sb-align-01.S",
        "slti-01.S", "srl-01.S", "xori-01.S", "auipc-01.S", "bltu-01.S", "lb-align-01.S",
        "lw-align-01.S", "sh-align-01.S", "sltiu-01.S", "srli-01.S"
    ]

    # Define the hex extraction function
    def hex_extraction(content):
        hex_pattern = re.compile(r'\b[0-9a-fA-F]{8}:\s+([0-9a-fA-F]+)\b')
        return hex_pattern.findall(content)

    # Function to extract DataMemory hex values from output_log.txt
    def extract_dataMemory(instruction_name):
        signature_folder = "/home/saad/Desktop/5stagepipeline/Signature"
        os.makedirs(signature_folder, exist_ok=True)
        signature_file_path = os.path.join(signature_folder, f"{instruction_name}.signature")
        
        with open("output_log.txt", "r") as log_file:
            log_content = log_file.read()
        
        data_memory_pattern = re.compile(r'\b[0-9a-fA-F]{8}\b')
        hex_values = data_memory_pattern.findall(log_content)
        
        with open(signature_file_path, "w") as signature_file:
            for hex_value in hex_values:
                signature_file.write(f"{hex_value}\n")
        print(f"Data memory extracted and saved in {signature_file_path}")

    # Paths for the output files
    output_file_path = "instructionmemHex.txt"
    final_output_file = "/home/saad/Desktop/5stagepipeline/src/main/scala/gcd/SingleCycle/imem.txt"

    # Create or clear the instructionmemHex.txt file before writing
    with open(output_file_path, "w") as output_file:
        output_file.write("")

    # Main loop to process each instruction
    for instruction in instructions:
        directory_path = f"/home/saad/riscof_work/rv32i_m/I/src/{instruction}/ref"
        file_path = os.path.join(directory_path, "ref.disass")
        
        try:
            if not os.path.exists(file_path):
                print(f"Warning: {file_path} does not exist. Skipping this instruction.")
                continue
            
            with open(file_path, 'r') as file:
                content = file.read()
            
            hex_values = hex_extraction(content)
            
            if hex_values:
                print(f"Extracted {len(hex_values)} hex values from {instruction}.")
                
                with open(final_output_file, "w") as imem_file:
                    for hex_value in hex_values:
                        imem_file.write(f"{hex_value}\n")
                
                # Run sbt test
                command = f'sbt "testOnly SingleCycle.TOPTest -- -DprogramFile={final_output_file} -DwriteVcd=1" > output_log.txt'
                subprocess.run(command, shell=True, check=True)
                print(f"sbt test completed for {instruction}.")
                
                # Extract and save data memory values
                extract_dataMemory(instruction.replace(".S", ""))
        
        except Exception as e:
            print(f"An error occurred while processing {instruction}: {e}")

    print("Process complete. Hex values have been processed, and signature files saved in the signature folder.")
