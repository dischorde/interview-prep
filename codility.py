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

def missing_integer(arr):
    nums_inside = set()

    for el in arr:
        nums_inside.add(el)

    # use pidgeonhole principle, if arr is length n, somewhere between
    # 1 and n + 1 must be missing
    for num in xrange(1, len(arr) + 2):
        if num not in nums_inside:
            return num

    return -1

def perm_check(arr):
    nums_inside = set()

    for num in arr:
        if num in nums_inside:
            return 0
        else:
            nums_inside.add(num)

    for expected in xrange(1,len(arr) + 1):
        if expected not in nums_inside:
            return 0

    return 1

def frog_river_one(river_size, leaves):
    needed = set()

    for time, leaf_position in enumerate(leaves):
        if leaf_position <= river_size:
            needed.add(leaf_position)
        if len(needed) == river_size:
            return time

    return -1

# you can write to stdout for debugging purposes, e.g.
# print "this is a debug message"

def max_counters(num_counters, arr):
    counters = [0] * num_counters
    cur_max = 0
    cur_min = 0

    for pos in arr:
        if pos == num_counters + 1:
            cur_min = cur_max
            continue
        counters[pos - 1] = max(counters[pos - 1], cur_min) + 1
        cur_max = max(cur_max, counters[pos - 1])

    for idx in xrange(num_counters):
        counters[idx] = max(counters[idx], cur_min)

    return counters
