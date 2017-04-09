def demo_equi(arr):
    right_sum = 0
    left_sum = 0

    for el in arr:
        right_sum += el

    for idx, el in enumerate(arr):
        right_sum -= el
        if right_sum == left_sum and 0 <= idx < len(arr) - 1:
            return idx
        else:
            left_sum += el

    return -1

def binary_gap(num):
    middle_digits = bin(num).strip("0b")
    max_gap = 0
    cur_gap = 0

    for digit in middle_digits:
        if digit == "0":
            cur_gap += 1
        else:
            if cur_gap > max_gap:
                max_gap = cur_gap
            cur_gap = 0

    return max_gap

def odd_occurances(arr):
    xor_result = 0
    for el in arr:
        xor_result ^= el

    return xor_result

def cyclic_rotation(arr, rotation):
    if len(arr) < 1:
        return []
    shift = rotation % len(arr)
    return arr[-shift:] + arr[:-shift]

def perm_missing_element(arr):
    sum = 0
    for expected in xrange(1,len(arr) + 2):
        sum += expected

    for actual in arr:
        sum -= actual

    return sum

from math import ceil

def frog_jumps(starting_point, destination, jump_distance):
    exact_jumps = (destination - starting_point) / float(jump_distance)
    return int(ceil(exact_jumps))

def tape_equilibrium(arr):
    left_sum = 0
    right_sum = 0
    minimum = None

    for el in arr:
        right_sum += el

    for idx, el in enumerate(arr):
        current_difference = abs(right_sum - left_sum)
        if idx > 0 and (minimum == None or current_difference < minimum):
            minimum = current_difference
        left_sum += el
        right_sum -= el

    return minimum
