require 'set'

# Question 1

def get_max_profit(arr)

  # make sure we have at least 2 prices
  if arr.length < 2
    raise IndexError, 'Getting a profit requires at least 2 prices'
  end

  # min_price = arr[0]
  # max_profit = arr[1] - arr[0]
  min = arr[0]
  max_profit = nil

  (1...arr.length).each do |index|

    potential_profit = arr[idx] - min
    max_profit = potential_profit if max_profit.nil? || potential_profit > max_profit
    min = arr[0] if arr[0] < min

    # current_price = arr[index]
    # # potential_profit = current_price - min_price
    # # max_profit = [max_profit, potential_profit].max
    # # min_price  = [min_price, current_price].min
  end

  max_profit
end

# Question 2

def product_of_all_others(arr)
  result = build_before(arr)
  prev = arr.last
  (arr.length - 2).downto(0) do |idx|
    result[idx] *= prev
    prev *= arr[idx]
  end
  result
end

def build_before(arr)
  before = [1]
  (1...arr.length).each do |i|
    before[i] = before[i - 1] * arr[i - 1]
  end
  before
end


# Question 3

# nlogn version
# def largest_tri_product(arr)
#   return nil if arr.length < 3
#   return arr.inject(:+) if arr.length == 3
#   sorted = arr.sort
#   opt1 = sorted[-1] * sorted[-2] * sorted[-3]
#   opt2 = sorted[0] * sorted[1] * sorted[-1]
#   return [opt1, opt2].max

def largest_tri_product(arr)
  return nil if arr.length < 3
  return arr.inject(:*) if arr.length == 3
  largest_three = arr.take(3)
  smallest_two = arr.take(2)
  arr.each do |num|
    minimum_large = largest_three.min
    maximum_small = smallest_two.max
    if num > minimum_large
      i = largest_three.find_index(minimum_large)
      largest_three[i] = num
    elsif num < smallest_two.max
      j = smallest_two.find_index(maximum_small)
      smallest_two[j] = num
    end
  end
  opt1 = largest_three.inject(:*)
  opt2 = smallest_two.inject(:*) * largest_three.max
  [opt1, opt2].max
end

# Question 28

# with a stack
# def parentheticals(sentence, start)
#   openers = []
#   sentence.chars.each_with_index do |letter, i|
#     if letter == "("
#       openers << i
#     elsif letter == ")"
#       current_start = openers.pop
#       return i if current_start == start
#     end
#   end
#   nil
# end

def parentheticals(sentence, start)
  return nil unless sentence[start] == "("
  to_close = 0
  (start + 1...sentence.length).each do |idx|
    if sentence[idx] == "("
      to_close += 1
    elsif sentence[idx] == ")"
      return idx if to_close == 0
      to_close -= 1
    end
  end
  nil
end

# Question 30

# version 1 (mine, with hash)

def perm_pal(word)
	counts = Hash.new(0)
    word.chars.each do |letter|
        counts[letter] += 1
    end
    num_odd = counts.values.count { |el| el.odd? }
    # if word.length.even?
    #     return true if num_odd == 0
    # else
    #     return true if num_odd == 1
    # end
    # false
    num_odd < 2
end

# version 2
def perm_pal(word)
  unpaired = Set.new
  word.chars.each do |letter|
    if unpaired.include?(letter)
      unpaired.remove(letter)
    else
      unpaired.add(letter)
    end
  end
  unpaired.length < 2
end
