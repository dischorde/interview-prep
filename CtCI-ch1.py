
def uniq_str(str):
    letters = set()
    for letter in str:
        if letter in letters:
            return False
        letters.add(letter)
    return True

def uniq_str2(str):
    letters = sorted(list(str))
    for idx in range(0, len(letters) - 2):
        if letters[idx] == letters[idx + 1]:
            return False
    return True
