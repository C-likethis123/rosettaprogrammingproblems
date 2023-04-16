'''Let us define a string, and assign it to the value 'here' '''

string = "here"
''' We assign the value of string1, a newly created string, to string, like this: '''

string1 = string

#Test for equality
print(string1 is string)

#returns True

''' The second way is to create a new string, string2. This time, we copy the contents onto string2 instead of assigning it to string directly '''
string2 = ""
for x in string:
    string2 += x

#Test for equality
print(string is string2)

#returns False


''' There is also the copy package. c = copy.copy(string) and d = copy.deepcopy(src) '''
