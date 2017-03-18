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
