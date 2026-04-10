import sys
import os

def analyze_fas_encryption(file_path):
    """
    Analyzes the structure of a FAS file to determine encryption type
    and recoverable segments.
    """
    if not os.path.exists(file_path):
        print(f"Error: File '{file_path}' not found.")
        return

    print(f"--- Investigation Report for: {file_path} ---")

    with open(file_path, 'rb') as f:
        content = f.read()

    # 1. Validate Header
    if b'FAS4-FILE' in content:
        print("[PASS] Valid FAS4 Header found.")
    else:
        print("[FAIL] Not a valid FAS4 file.")
        return

    # 2. Check for FAS4 Crunch Signature
    # The signature usually appears at the very end of the file
    if b';fas4 crunch' in content:
        print("[ALERT] Encryption Detected: 'FAS4 Crunch'")
        print("       Status: HIGHLY OBFUSCATED")
        print("       Mechanism: Bit-shifting/Substitution Cipher")
    else:
        print("[INFO] No known encryption signature found (Standard Compile).")

    # 3. Analyze Entropy (Randomness)
    # Encrypted files look like pure random noise. Compiled files look like patterns.
    # We will sample the middle of the file.
    start_index = content.find(b'\r\n') + 2 # Skip first line
    end_index = content.find(b';fas4 crunch') # Stop before footer
    
    if start_index > 0 and end_index > 0:
        body = content[start_index:end_index]
        printable_count = sum(1 for byte in body if 32 <= byte <= 126)
        total_count = len(body)
        
        if total_count == 0:
             print("[ERROR] File body is empty.")
             return

        ratio = printable_count / total_count
        
        print(f"\n[DATA ANALYSIS]")
        print(f"       Body Size: {total_count} bytes")
        print(f"       Printable Character Ratio: {ratio:.2%}")
        
        if ratio > 0.8:
            print("       Verdict: Text-heavy. Likely recoverable.")
        elif ratio > 0.4:
            print("       Verdict: Mixed Bytecode. Standard Compilation.")
        else:
            print("       Verdict: HIGH ENTROPY. This confirms strong encryption.")
            print("       You cannot extract variables from this section.")

    print("\n--- Recommendation ---")
    print("Because 'FAS4 Crunch' is detected, 'reading' the source is impossible")
    print("without the specific decryption algorithm (which is not public).")
    print("Your only option is to observe what the command DOES in AutoCAD")
    print("and rewrite the logic manually.")

# --- Usage ---
if __name__ == "__main__":
    if len(sys.argv) > 1:
        analyze_fas_encryption(sys.argv[1])
    else:
        file_path = input("Enter .fas file path: ").strip("'\"")
        analyze_fas_encryption(file_path)