def get_string(string):
    substring = input("Get characters of string starting from n characters and m length (max is %d): " % len(string))
    substring = substring.split(" ")
    n = int(substring[0])
    m = int(substring[1])
    print('From %d to %d: %s' % (n, m + n, string[n:m + n + 1]))

    print('\nFrom %d to the end: %s' % (n, string[n:]))

    print('\nWhole string minus last character: %s' % string[:-1]) 
        
    character = input("Input a character within the string: ")
    first_index = string.index(character)
    print('\n From %s to the next %d characters: %s' % (character, m, string[first_index: first_index + m + 1]))

    known_substring = input('Key in a known substring: ')
    
    is_substring_found = False
    first_character_substring = known_substring[0]
    
    while not is_substring_found:
        first_index = known_substring.index(first_character_substring)
        for x in range(len(known_substring)):
            if known_substring[x] != string[first_index + x]:
                is_substring_found = False
                continue


        is_substring_found = True



    print('\From a known substring: %s' % string[first_index: first_index + len(known_substring)])
