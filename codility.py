def demo_equi(arr):
    right_sum = sum(arr)
    left_sum = 0

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
    right_sum = sum(arr)
    minimum = None

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

def count_div(interval_start, interval_end, k):
    # if the interval divides evenly, answer is number of chunks of k
    # in the interval, plus 1 for interval_start itself
    if interval_start % k == 0:
        return ((interval_end - interval_start) // k) + 1
    # if not, it is the number of chunks of k from the last number
    # divisible by k, not including that number
    else:
        last_divisible = interval_start - (interval_start % k)
        return (interval_end - last_divisible) // k

def passing_cars(road):
    num_pairs = 0
    num_west = 0

    for idx in reversed(xrange(len(road))):
        if num_pairs > 1000000000: return -1
        elif road[idx] == 1: num_west += 1
        else: num_pairs += num_west

    return num_pairs

def dna_string_nm(dna_string, start_indicies, end_indicies):
    results = []
    for idx in xrange(len(start_indicies)):
        start = start_indicies[idx]
        end = end_indicies[idx]
        results.append(find_min(dna_string, start, end))
    return results

def find_min(dna_string, start, end):
    min = 5
    for idx in xrange(start,end + 1):
        letter = dna_string[idx]
        if letter == "A" and min > 1:
            min = 1
        if letter == "C" and min > 2:
            min = 2
        if letter == "G" and min > 3:
            min = 3
        if letter == "T" and min > 4:
            min = 4
    return min

def genomic_range(dna_string, start_indicies, end_indicies):
    a, c, g = prefix_dna_counts(dna_string)
    results = []

    for idx in xrange(len(start_indicies)):
        start = start_indicies[idx]
        end = end_indicies[idx] + 1
        if a[end] - a[start] > 0:
            results.append(1)
        elif c[end] - c[start] > 0:
            results.append(2)
        elif g[end] - g[start] > 0:
            results.append(3)
        else:
            results.append(4)

    return results

def prefix_dna_counts(dna_string):
    a = [0] * (len(dna_string) + 1)
    c = [0] * (len(dna_string) + 1)
    g = [0] * (len(dna_string) + 1)

    for idx, letter in enumerate(dna_string):
        idx += 1
        a[idx] = a[idx - 1]
        c[idx] = c[idx - 1]
        g[idx] = g[idx - 1]
        if letter == "A": a[idx] += 1
        elif letter == "C": c[idx] += 1
        elif letter == "G": g[idx] += 1

    return [a, c, g]

def min_avg_two_slice(arr):
    min_idx = None
    min_value = None

    for idx in xrange(0, len(arr) - 1):
        check_two = (arr[idx] + arr[idx + 1]) / 2.0
        if min_value == None or check_two < min_value:
            min_idx = idx
            min_value = check_two

        if idx > len(arr) - 3: continue

        check_three = (arr[idx] + arr[idx + 1] + arr[idx + 2]) / 3.0
        if check_three < min_value:
            min_idx = idx
            min_value = check_three

    return min_idx
