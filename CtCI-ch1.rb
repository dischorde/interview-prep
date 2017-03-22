require 'set'

def check_perm_2(str1, str2)
  return false if str1.length != str2.length
  counts = Hash.new(0)
  str1.length.times do |i|
    counts[str1[i]] += 1
    counts[str2[i]] -= 1
  end
  counts.all? { |_, v| v == 0 }
end

def check_perm_3(str1, str2)
  return false if str1.length != str2.length
  comparison = 0
  str1.length.times do |i|
    comparison ^= str1[i].ord
    comparison ^= str2[i].ord
  end
  comparison == 0
end

def palindrome_permutation(str)
  odd = 0
  counts = Hash.new(0)
  str.chars.each do |letter|
    next if letter == ' '
    counts[letter] += 1
    if counts[letter].odd?
      odd += 1
    else
      odd -= 1
    end
  end
  odd == str.length % 2
end

def rotate_matrix(matrix)
  # in place, translated from java solution
  raise "cannot rotate!" if matrix.empty? || matrix[0].length != matrix.length
  mid = matrix.length / 2
  mid.times do |layer|
    first = layer
    last = matrix.length - 1 - layer
    (first...last).each do |i|
      offset = i - first
      top = matrix[first][i]

      # left -> top
      matrix[first][i] = matrix[last - offset][first]

      # bottom -> left
      matrix[last - offset][first] = matrix[last][last - offset]

      # right -> bottom
      matrix[last][last - offset] = matrix[i][last]

      # bottom -> right
      matrix[i][last] = top
    end

  end
  matrix
end

def zero_matrix_v1(matrix)
  rows_to_zero = Set.new
  cols_to_zero = Set.new

  matrix.each_index do |row|
    matrix[0].each_index do |col|
      if matrix[row][col] == 0
        rows_to_zero.add(row)
        cols_to_zero.add(col)
      end
    end
  end

  rows_to_zero.each do |row|
    matrix[0].each_index do |col|
      matrix[row][col] = 0
    end
  end

  cols_to_zero.each do |col|
    matrix.each_index do |row|
      matrix[row][col] = 0
    end
  end
  matrix
end

def zero_matrix_v2(matrix)
  zero_first_row = false
  zero_first_col = false

  matrix.each_index do |row|
    matrix[0].each_index do |col|
      if row == 0 && matrix[row][col] == 0
        zero_first_row = true
      elsif col == 0 && matrix[row][col] == 0
        zero_first_col = true
      elsif matrix[row][col] == 0
        matrix[0][col] = 0
        matrix[row][0] = 0
      end
    end
  end

  (1...matrix.length).each do |row|
    (1...matrix[0].length).each do |col|
      if matrix[0][col] == 0 || matrix[row][0] == 0
        matrix[row][col] = 0
      end
    end
  end

  if zero_first_row
    matrix[0].each_index do |col|
      matrix[0][col] = 0
    end
  end

  if zero_first_col
    matrix.each_index do |row|
      matrix[row][0] = 0
    end
  end

  matrix
end

class Node
  # node for singly linked list
  def initialize(val)
    @val = val
    @next = nil
  end
end

# O(n) time O(n) space version, takes in the head node of a linked list
def remove_dups(head)
  seen = Set.new
  crawler = head
  prev = nil
  until crawler.nil?
    if seen.include?(crawler.val)
      prev.next = crawler.next
    else
      seen.add(crawler.val)
      prev = crawler
    end
    crawler = crawler.next
  end
  head
end

# O(n^2) time O(1) space version
def remove_dups_2(head)
  check = head
  until check.nil?
    crawler = check
    until crawler.next.nil?
      if check.val == crawler.next.val
        cralwer.next = cralwer.next.next
      else
        crawler = crawler.next
      end
    end
    check = check.next
  end
  head
end

class MinStackWithArrays
  def initialize
    @stack = []
  end

  def push(value)
    if @stack.empty?
      @stack.push([value, value])
    else
      new_min = [value, @stack.last[1]].min
      @stack.push([value, new_min])
    end
    @stack
  end

  def pop
    @stack.pop[0]
  end

  def min
    @stack.last[1]
  end
end

class MinStackWithStack
  def initialize
    @stack = []
    @mins = []
  end

  def push(value)
    if @mins.empty? || @mins.last >= value
      @mins.push(value)
    end
    @stack.push
  end

  def pop
    popped = @stack.pop
    if min == popped
      @mins.pop
    end
    popped
  end

  def min
    @mins.last
  end
end


class SetOfStacks
  def initialize(threshold)
    @set = [[]]
    @last_stack_idx = 0
    @threshold = threshold
  end

  def push(val)
    add_stack if last_stack.length == @threshold
    last_stack.push(val)
  end

  def pop
    last_stack.pop
  end

  def pop_at(idx)
    @set[idx].pop
    # reorganize(idx) & return popped
  end

  private

  def add_stack
    @set.push([])
    @last_stack_idx += 1
  end

  def last_stack
    @set[@last_stack_idx]
  end

  # def reorganize(starting_idx)
  #   (starting_idx...@last_stack_idx).each do |cur|
  #     top = @set[cur + 1].shift
  #     @set[cur].push(top)
  #   end
  # end

end
