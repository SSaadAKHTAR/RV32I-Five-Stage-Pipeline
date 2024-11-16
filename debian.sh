#!/bin/bash

# Ensure a single test path is passed
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <test_path>"
    exit 1
fi

test_path="$1"


SIGNATURE_FOLDER="/home/saad/Desktop/5stagepipeline/Signature"
FINAL_OUTPUT_FILE="/home/saad/Desktop/5stagepipeline/src/main/scala/gcd/SingleCycle/imem.txt"
Core="/home/saad/Desktop/5stagepipeline/"
OUTPUT_LOG="output_log.txt"

# Create the signature folder if it doesn't exist
mkdir -p "$SIGNATURE_FOLDER"

# Extract instruction name from path
instruction_name=$(basename "$test_path" .S)

# Check if the test file exists
if [[ ! -f "$test_path" ]]; then
    echo "Error: $test_path does not exist. Exiting."
    exit 1
fi

# Hex extraction
disass="riscv32-unknown-elf-objdump -M no-aliases -d $test_path> disass.disass"
eval "$disass"
hex_values=$(grep -oE '[0-9a-fA-F]{8}:[[:space:]]+[0-9a-fA-F]+' "disass.disass" | awk '{print $2}')
if [[ -z "$hex_values" ]]; then
    echo "No hex values extracted from $instruction_name. Skipping."
    exit 0
fi

# Save hex values to the final output file
echo "$hex_values" > "$FINAL_OUTPUT_FILE"

# Run sbt test
cd "$Core"
sbt_command="sbt \"testOnly SingleCycle.TOPTest -- -DprogramFile=$FINAL_OUTPUT_FILE -DwriteVcd=1\" > $OUTPUT_LOG"
eval "$sbt_command"

if [[ $? -eq 0 ]]; then
    echo "sbt test completed for $instruction_name."
    # Extract DataMemory values
    grep -oE '\b[0-9a-fA-F]{8}\b' "$OUTPUT_LOG" > "$SIGNATURE_FOLDER/$instruction_name.signature"
    echo "Data memory extracted and saved in $SIGNATURE_FOLDER/$instruction_name.signature"
else
    echo "Error: sbt test failed for $instruction_name."
fi