def change(sequence):
    res = []
    counter = 1
    for i in range(len(sequence) - 1):
        if sequence[i] == sequence[i + 1]:
            counter += 1
        else:
            res.append(sequence[i] * counter)
            counter = 1



    print(res) 
