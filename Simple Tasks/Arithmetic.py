import math

numbers = input("Key in two numbers: ")
arr = numbers.split(" ")
for x in range(2):
        arr[x] = int(arr[x])

print("The sum is %d \n" % sum(arr))
print("The difference is %d \n" % (arr[0] - arr[1]))
print("The product is %d \n" % (arr[0] * arr[1]))
print("The quotient is %d \n" % (math.floor(arr[0] / arr[1])))
print("The remainder is %d \n" % (arr[0] % arr[1]))
print("The exponentiation is %d \n" % (arr[0]**arr[1]))
      
