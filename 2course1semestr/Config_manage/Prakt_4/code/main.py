import json

with open('civgraph.json') as f:
    d = json.load(f)
    print(d)

KeyAndValues = dict()

for key in d:
    tmp = ''
    for values in d[key]:
        tmp += values
        tmp += ' '
    KeyAndValues[key] = tmp

makeFile = open('C:/Users/sidor/Desktop/unik/Config_manage/Prakt_4/makefile','w')

makeFile.write(".PHONY: ")

for keys in KeyAndValues.keys():
    makeFile.write(keys+" ")
makeFile.write("\n")

for keys in KeyAndValues.keys():
    makeFile.write(keys + ": " + KeyAndValues[keys] + "\n")
    makeFile.write("\t@echo " + keys + "\n")

