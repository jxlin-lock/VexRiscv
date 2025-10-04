import subprocess
import sys
import os
import signal
import random
import time
import random

# Global variable to hold the background setter process
setter_process = None

def main():
    
    
    # --- Start the Getter Loop ---
    # The getter runs in the foreground in the main Python process.
    getter_keys = ["key1", "key2", "key3", "key4", "key5", "keynonexist"]
    print("Getter started...", flush=True)
    
    while True:
        try:
            key = random.choice(getter_keys)
            subprocess.run(["./getter", key])
        except KeyboardInterrupt:
            cleanup_handler(None, None)


if __name__ == "__main__":
    main()