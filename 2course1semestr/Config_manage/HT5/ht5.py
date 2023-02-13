import os
import zlib
import string


def createGraph(nodes):

    graph = "digraph Git {\n"

    for node in nodes:
        parents = []

        for i in range(len(node["parents"])):
            for n in nodes:
                if n["id"] == node["parents"][i]:
                    parents.append(n["text"])

        for i in range(len(parents)):
            graph += f'  {parents[i]} -> {node["text"]}\n'

    graph += "}"

    return graph


def createNodes(commits, trees, blobs):
    
    arr = commits + trees + blobs
    nodes = []
    ascii_uppercase = list(string.ascii_uppercase)
    for i in range(len(arr)):
        node = {}
        name = ""
        
        if i >= len(ascii_uppercase):
            name += ascii_uppercase[(i%len(ascii_uppercase))-1] + str(i)
        else: name = ascii_uppercase[i]

        node["id"] = arr[i]["name"]
        node["name"] = name
        node["type"] = arr[i]["type"]
        node["parents"] = []

        if arr[i]["type"] == "commit":
            node["parents"] = arr[i]["parents"]
            node["text"] = "Commit: " + arr[i]["commitText"]

        elif arr[i]["type"] == "tree":
            tree_name = ""

            for commit in commits:
                if commit["tree"] == arr[i]["name"]:
                    node["parents"].append(commit["name"])
            for tree in trees:
                for file in tree["files"]:
                    if file["filePath"] == arr[i]["name"]:
                        node["parents"].append(tree["name"])
                        tree_name = file["name"]
                        break

            if tree_name != "":
                node["text"] = f"tree: {tree_name}"

            else: node["text"] = "tree"

        elif arr[i]["type"] == "blob":
            fileName = ""
            for tree in trees:
                for file in tree["files"]:
                    if file["filePath"] == arr[i]["name"]:
                        node["parents"].append(tree["name"])
                        fileName = file["name"]
                        break

            node["text"] = fileName
        nodes.append(node)
    return nodes

    
def getGitObj(project_path):


    git_objects_path = ".\.git\objects"
    objects_path = os.path.join(os.path.normpath(project_path), os.path.normpath(git_objects_path))
    objects_dir = os.walk(objects_path)

    commits = []
    trees = []
    blobs = []

    for object in objects_dir:
        path_arr = os.path.split(object[0])
        
        if len(path_arr[-1]) == 2:
            for i in range(len(object[2])):
                
                file_path = os.path.join(object[0], object[2][i])
                file_name = path_arr[-1] + object[2][i]
                text = getText(file_path)
                type = text.split()[0].decode("utf-8")
                if type == "commit":
                    commit = parseCommit(text, file_name)
                    commits.append(commit)
                elif type == "tree":
                    tree = parseTree(text, file_name, project_path)
                    trees.append(tree)
                elif type == "blob":
                    blob = parseBlob(text, file_name)
                    blobs.append(blob)
    return commits, trees, blobs

def getText(filename):
    with open(filename, 'rb') as file:
        text = file.read()

    return zlib.decompress(text)

def parseCommit(text, file_name):

    arrayContent = text.split(b'\n')
    commit = {}
    commit["type"] = "commit"
    commit["name"] = file_name
    commit["parents"] = []

    for i in range(len(arrayContent) - 3):

        arrayLines = arrayContent[i].split()

        if arrayLines[0].decode("utf-8") == "commit":
            commit["tree"] = arrayLines[-1].decode("utf-8")

        elif arrayLines[0].decode("utf-8") == "parent":
            commit["parents"].append(arrayLines[1].decode("utf-8"))

        elif arrayLines[0].decode("utf-8") == "author":
            commit["authorName"] = arrayLines[1].decode("utf-8")
            commit["authorEmail"] = arrayLines[2].decode("utf-8")

        elif arrayLines[0].decode("utf-8") == "committer":
            commit["committerName"] = arrayLines[1].decode("utf-8")
            commit["committerEmail"] = arrayLines[2].decode("utf-8")
            break

    for i in range(len(arrayContent) - 1, 0, -1):
        if len(arrayContent[i]) > 0:
            commit["commitText"] = arrayContent[i].decode("utf-8")
            break

    return commit

def parseTree(text, file_name, project_path):

    tree = {}
    tree["type"] = "tree"
    tree["name"] = file_name
    files = []
    zero_byte = text.find(b'\x00')
    type_size = text[0:zero_byte]
    text = text[zero_byte+1:]

    files = []

    while len(text):

        zero_byte = text.find(b'\x00')
        name_line = text[0:zero_byte].decode("utf-8").split()
        text = text[zero_byte+1:]
        file_path = text[0:20]
        files.append({
            "type": checkGitType(file_path.hex(), project_path),
            "mode": name_line[0],
            "name": name_line[1],
            "filePath": file_path.hex()
        })
        text = text[20:]
        tree["files"] = files

    return tree

def parseBlob(text, file_name):

    blob = {}
    blob["type"] = "blob"
    blob["name"] = file_name
    space_ind = text.find(b' ')
    zero_byte = text.find(b'\x00')
    blob["size"] =text[space_ind + 1:zero_byte].decode("utf-8")
    blob["content"] = text[zero_byte + 1:]
    return blob


def checkGitType(file_path, project_path):
    
    git_objects_path = ".\.git\objects"
    project_path = os.path.normpath(project_path)
    git_objects_path = os.path.normpath(git_objects_path)
    objects_path = os.path.join(project_path, git_objects_path, file_path[0:2], file_path[2:])

    return getText(objects_path).split()[0].decode("utf-8")





if __name__ == "__main__":
    project_path = os.getcwd()

    commits, trees, blobs = getGitObj(project_path)
    nodes = createNodes(commits, trees, blobs)
    graph = createGraph(nodes)

    print(graph)
