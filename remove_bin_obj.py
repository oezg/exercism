import os
import shutil

def remove_bin_directories(root_dir):
    for dirpath, dirnames, _ in os.walk(root_dir):
        for dirname in dirnames:
            if dirname in ("bin", "obj"):
                bin_dir = os.path.join(dirpath, dirname)
                print(f"Removing {bin_dir}")
                if "sharp" not in bin_dir and "java" not in bin_dir:
                    input("ok?")
                shutil.rmtree(bin_dir)

# Specify the root directory where you want to start the search
root_directory = "."
remove_bin_directories(root_directory)
