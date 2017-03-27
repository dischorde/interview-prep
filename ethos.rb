def cool_number_rec?(num)
  return true if num == 1
  return false if num == 4
  cool_number?(squared_digit_sum(num))
end

def cool_number?(num)
  sum = num
  until sum == 1 || sum == 4
    sum = squared_digit_sum(sum)
  end
  sum == 1 ? true : false
end

def squared_digit_sum(num)
  sum = 0
  digit = num % 10
  remainder = num / 10
  until remainder.zero?
    sum += digit**2
    digit = remainder % 10
    remainder /= 10
  end
  sum + digit**2
end

def cool_nums_sum
  sum = 0
  (1..1000000).each do |num|
    sum += num if cool_number?(num)
  end
  sum
end
