import os
import shutil


directories = (
    "bin", 
    "obj", 
    ".vs", 
    ".mono", 
    "elm-stuff", 
    "target", 
    ".cpcache", 
    "__pycache__",
    ".gradle",
    "build"
)

def test_directory(dirpath, dirname):
    if "." == dirpath:
        return dirname in (".mono", ".vscode", ".vs")
    match dirpath.split("/")[1]:
        case "elm":
            return "elm-stuff" == dirname
        case "csharp" | "fsharp":
            return dirname in ("bin", "obj", ".vs")
        case "clojure":
            return dirname in ("target", ".cpcache")
        case "java":
            return dirname in ("bin", ".gradle", "build")
        case "python":
            return dirname in (".pytest_cache", "__pycache__")
    return dirname == ".idea"


def remove_directories(root_dir):
    for dirpath, dirnames, _ in os.walk(root_dir):
        for dirname in dirnames:
            if test_directory(dirpath, dirname):
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
    

root_directory = "."
remove_directories(root_directory)
remove_files(root_directory)
