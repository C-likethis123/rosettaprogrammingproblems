def factorial(number, prev):
    if number == 1:
        return prev
    else:
        return factorial(number - 1, prev * number)



def factorial_recursive(number):
    if number == 1:
        return 1
    else:
        return number * factorial_recursive(number - 1)
