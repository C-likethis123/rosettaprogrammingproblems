def reading(filename):
    try:
        f = open(filename)
        cursor = f.tell()
        print(f.readline())
        while cursor != f.tell():
            cursor = f.tell()
            print("%s" % f.readline())

        f.close()

    except FileNotFoundError:
        print("%s cannot be found!" % filename)

'''
Model solution:

with open("foobar.txt") as f:
    for line in f:
        process(line)
'''
