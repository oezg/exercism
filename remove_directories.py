import os
import shutil


def remove_directories(root_dir, directories):
    for dirpath, dirnames, _ in os.walk(root_dir):
        for dirname in dirnames:
            if dirname in directories:
                direcotry_path = os.path.join(dirpath, dirname)
                print(f"Removing directory: {direcotry_path}")
                shutil.rmtree(direcotry_path)


def test_filename(dirpath, filename):
    if "clojure" in dirpath:
        return filename == ".lein-failures"
    if "csharp" in dirpath:
        return filename == ".editorconfig" or filename.endswith(".sln")
    return False


def remove_files(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if test_filename(dirpath, filename):
                file_path = os.path.join(dirpath, filename)
                print(f"Deleting file: {file_path}")
                os.remove(file_path)
    

directories = ("bin", "obj", ".vs", ".mono", "elm-stuff", "target", ".cpcache", "__pycache__")
root_directory = "."
remove_directories(root_directory, directories)
remove_files(root_directory)