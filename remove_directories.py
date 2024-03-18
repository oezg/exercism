import os
import shutil


def remove_directories(root_dir, directories):
    for dirpath, dirnames, _ in os.walk(root_dir):
        for dirname in dirnames:
            if dirname in directories:
                direcotry_path = os.path.join(dirpath, dirname)
                print(f"Removing {direcotry_path}")
                shutil.rmtree(direcotry_path)


directories = ("bin", "obj", ".vs", ".mono", "elm-stuff", "target", ".cpcache")
root_directory = "."
remove_directories(root_directory, directories)
