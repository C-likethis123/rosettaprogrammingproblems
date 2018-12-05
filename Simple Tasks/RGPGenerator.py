from random import randint
def reset(arr):
    for i in range(len(arr)):
        arr[i] = 0


def generate_values():
    values = [0] * 6
    while sum(values) < 75 and (values[4] or values[5] < 15):
        reset(values)
        for i in range(4):
            values[i] = randint(1,6)

        values[4] = sum(values) - min(values[0],values[1],values[2],values[3])
        values[5] = sum(values)


    print(values)

