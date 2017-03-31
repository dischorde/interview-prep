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
