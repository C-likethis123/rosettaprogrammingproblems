for i in range(1,101):
    if i % 15 == 0:
        print("Fizzbuzz\n")
    elif i % 3 == 0:
        print("Fizz \n")
    elif i % 5 == 0:
        print("Buzz \n")
    else:
        print("%d" % i)
