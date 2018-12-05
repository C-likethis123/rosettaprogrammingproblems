from sys import stdout
write = stdout.write

for i in range(1,13):
    for j in range(1,13):
        if j >= i:
            product = str(i * j)
            write('%s ' % product)
        else:
            write('    ')

    write('\n')
