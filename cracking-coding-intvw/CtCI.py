# Question 1.1

def uniq_str(str):
    '''
    Returns a boolean, true if a string contains only unique characters
    false otherwise. O(n) time. 
    '''
    letters = set()
    for letter in str:
        if letter in letters:
            return False
        letters.add(letter)
    return True

def uniq_str2(str):
    '''
    Returns a boolean, true if a string contains only unique characters
    false otherwise. O(nlogn) time using no additional data structures. 
    '''
    letters = sorted(list(str))
    for idx in range(0, len(letters) - 2):
        if letters[idx] == letters[idx + 1]:
            return False
    return True

def check_perm(str1, str2):
    counts = {}
    for letter in str1:
        if letter in counts:
            counts[letter] += 1
        else:
            counts[letter] = 1
    for letter in str2:
        if letter in counts:
            counts[letter] -= 1
        else:
            return False
    for val in counts.values():
        if val != 0:
            return False
    return True

def check_perm_2(str1, str2):
    counts = {}
    if len(str1) != len(str2):
        return False
    for idx in range(0, len(str1)):
        letter1 = str1[idx]
        letter2 = str2[idx]
        if letter1 in counts:
            counts[letter1] += 1
        else:
            counts[letter1] = 1
        if letter2 in counts:
            counts[letter2] -= 1
        else:
            counts[letter2] = -1
    for val in counts.values():
        if val != 0:
            return False
    return True

def check_perm_3(str1, str2):
    if len(str1) != len(str2):
        return False 
    comparison = 0
    for i in range(0, len(str1)):
        comparison ^= ord(str1[i])
        comparison ^= ord(str2[i])
    return comparison == 0