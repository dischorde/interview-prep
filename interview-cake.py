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
