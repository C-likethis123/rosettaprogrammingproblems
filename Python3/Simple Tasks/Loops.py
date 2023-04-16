from sys import stdout

def loops(n):
    write = stdout.write
    for i in range(1, n + 1):
        string = str(i)
        write(string)
