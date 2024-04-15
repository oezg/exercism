#!/usr/bin/env python

import os
import sys

directory = sys.argv[1]
test_directory = os.path.join(directory, 'src', 'test', 'java')
files = os.listdir(test_directory)
test = [file for file in files if file.endswith("Test.java")][0]
file_path = os.path.join(test_directory, test)

with open(file_path, "r+", encoding="utf-8") as test_file:
    text = test_file.read()
    unskipped_text = text.replace('    @Disabled("Remove to run test")\n', '')
    test_file.seek(0)
    test_file.write(unskipped_text)
    test_file.truncate()
