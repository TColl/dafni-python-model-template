import os

INPUT_DIR = "/data/inputs"
OUTPUT_DIR = "/data/outputs"

with open(os.path.join(OUTPUT_DIR, "hello.txt"), "w") as f:
    f.write("hello, world!")
