import subprocess
import sys
import os
import signal
import random
import time
import random


def main():

    while True:
        setter_keys = ["key1", "key2", "key3", "key4", "key5"]
        # Using 'shuf -n1 -e' is an efficient way to pick a random key in the shell.

        selected_key = random.choice(setter_keys)
        value = f"val-{selected_key}-{int(time.time() * 1e9)}"
        
        # Start the setter process in the background using subprocess.Popen
        setter_process = subprocess.run(['./setter', selected_key, value])

if __name__ == "__main__":
    main()