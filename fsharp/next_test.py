#!/usr/bin/env python

import os
import sys

directory = sys.argv[1]
files = os.listdir(directory)
test = [file for file in files if file.endswith("Tests.fs")][0]
file_path = os.path.join(directory, test)

with open(file_path, "r+", encoding="utf-8") as test_file:
    text = test_file.read()
    unskipped_text = text.replace('(Skip = "Remove this Skip property to run this test")', '', 1)
    test_file.seek(0)
    test_file.write(unskipped_text)
    test_file.truncate()
