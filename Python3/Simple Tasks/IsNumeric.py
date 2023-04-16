def isNumeric(string):
    try:
        print("%d" % int(string))
    except ValueError:
        try:
            print("%f" % float(string))
        except ValueError:
            print("%s is not a numeral string" % string)
