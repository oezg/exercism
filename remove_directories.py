import os
import shutil


def remove_directories(root_dir, directories, files=None):
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for dirname in dirnames:
            if dirname in directories:
                direcotry_path = os.path.join(dirpath, dirname)
                print(f"Removing directory: {direcotry_path}")
                shutil.rmtree(direcotry_path)
        for filename in filenames:
            if files is not None and filename in files:
                file_path = os.path.join(dirpath, filename)
                print(f"Deleting file: {file_path}")
                os.remove(file_path)


directories = ("bin", "obj", ".vs", ".mono", "elm-stuff", "target", ".cpcache")
files = (".lein-failures", ".editorconfig")
root_directory = "."
remove_directories(root_directory, directories, files)
