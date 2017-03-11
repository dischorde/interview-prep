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
