numbers = input("Key in two numbers: ")
arr = numbers.split(" ")

for x in range(2):
        arr[x] = int(arr[x])

print(sum(arr))
