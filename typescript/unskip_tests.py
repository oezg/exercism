#!/usr/bin/env python

import os
import sys

directory = sys.argv[1]
files = os.listdir(directory)
test = [file for file in files if file.endswith(".test.ts")][0]
file_path = os.path.join(directory, test)

with open(file_path, "r+", encoding="utf-8") as test_file:
    text = test_file.read()
    unskipped_text = text.replace(' xit(', ' it(')
    test_file.seek(0)
    test_file.write(unskipped_text)
    test_file.truncate()

package_json = next(file for file in files if file == 'package.json')
package_json_path = os.path.join(directory, package_json)

with open(package_json_path, 'r+', encoding='utf-8') as package_json_file:
    text = package_json_file.read()
    unskipped_text = text.replace('"test": "yarn lint:types && jest --no-cache', '"test": "yarn lint:types && jest --no-cache --watchAll', 1)
    package_json_file.seek(0)
    package_json_file.write(unskipped_text)
    package_json_file.truncate()