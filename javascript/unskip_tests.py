#!/usr/bin/env python

import os
import sys

directory = sys.argv[1]
files = os.listdir(directory)
test = [file for file in files if file.endswith(".spec.js")][0]
file_path = os.path.join(directory, test)

with open(file_path, "r+", encoding="utf-8") as test_file:
    text = test_file.read()
    unskipped_text = text.replace('xtest(', 'test(')
    test_file.seek(0)
    test_file.write(unskipped_text)
    test_file.truncate()
