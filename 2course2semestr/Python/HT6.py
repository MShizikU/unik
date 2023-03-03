def main(x):
    MyDict = {
        1978: {
            1971: {
                1968: 0,
                1957: {
                    'GLSL': 1,
                    'LOGOS': 2,
                    'NIM': 3
                }
            },
            2005: {
                'GLSL': {
                    1968:4,
                    1957: 5
                },
                'LOGOS': {
                    1968: 6,
                    1957: 7
                },
                'NIM': 8
            },
            1998:{
                1968: 9,
                1957: 10
            }
        },
        1968: 11,
        2001: 12
    }
    while not(isinstance(MyDict, int)):
        for i in x:
            if i in MyDict.keys():
                MyDict = MyDict[i]
                break
    return MyDict
