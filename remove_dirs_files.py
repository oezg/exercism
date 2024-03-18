import os
import shutil


def test_directory(dirpath, dirname):
    if "." == dirpath:
        return dirname in (".mono", ".vscode", ".vs", ".clj-kondo", ".lsp")
    match dirpath.split("/")[1]:
        case "elm":
            return "elm-stuff" == dirname
        case "csharp" | "fsharp":
            return dirname in ("bin", "obj", ".vs")
        case "clojure":
            return dirname in ("target", ".cpcache", ".clj-kondo", ".lsp")
        case "java":
            return dirname in ("bin", ".gradle", "build", ".idea")
        case "python":
            return dirname in (".pytest_cache", "__pycache__")
        case "javascript" | "typescript":
            return dirname == "node_modules"
        case _:
            return dirname == ".idea"


def remove_directories(root_dir):
    for dirpath, dirnames, _ in os.walk(root_dir):
        for dirname in dirnames:
            if test_directory(dirpath, dirname):
                direcotry_path = os.path.join(dirpath, dirname)
                print(f"Removing directory: {direcotry_path}")
                shutil.rmtree(direcotry_path)


def test_filename(dirpath: str, filename: str) -> bool:
    if filename.endswith(".sln"):
        return True
    if "." == dirpath:
        return False
    match dirpath.split("/")[1]:
        case "csharp" | "fsharp":
            return filename == ".editorconfig"
        case "clojure":
            return filename == ".lein-failures"
        case "javascript" | "typescript":
            return filename in ("package-lock.json", "yarn.lock")
        case _:
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
