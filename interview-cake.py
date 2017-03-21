# Question 1

  def get_max_profit(stock_prices_yesterday):
    # make sure we have at least 2 prices
    if len(stock_prices_yesterday) < 2:
        raise IndexError('Getting a profit requires at least 2 prices')

    # we'll greedily update min_price and max_profit, so we initialize
    # them to the first price and the first possible profit
    min_price = stock_prices_yesterday[0]
    max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

    for index, current_price in enumerate(stock_prices_yesterday):
        if index == 0:
            continue

        potential_profit = current_price - min_price

        max_profit = max(max_profit, potential_profit)
        min_price  = min(min_price, current_price)

    return max_profit


# Question 4
def merge_timeset(timeset):
    ordered = sorted(timeset)
    merged_times = [ordered[0]]
    for i in xrange(1, len(timeset)):
        current = merged_times[len(merged_times) - 1]
        merge = try_merge(current, ordered[i])
        if merge != None:
            merged_times.pop()
            merged_times.append(merge)
        else:
            merged_times.append(ordered[i])
    return merged_times

def try_merge(t1, t2):
    start1, end1 = t1
    start2, end2 = t2
    if start1 <= start2 <= end1 or start2 <= start1 <= end2:
        return (min(start1, start2), max(end1, end2))
    return None

# Question 30

  def has_palindrome_permutation(the_string):

    # track characters we've seen an odd number of times
    unpaired_characters = set()

    for char in the_string:
        if char in unpaired_characters:
            unpaired_characters.remove(char)
        else:
            unpaired_characters.add(char)

    # the string has a palindrome permutation if it
    # has one or zero characters without a pair
    return len(unpaired_characters) <= 1
