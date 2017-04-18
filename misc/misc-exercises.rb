require 'byebug'

ROMAN_CHARACTERS = {
  0 => "",
  1 => "I",
  4 => "IV",
  5 => "V",
  9 => "IX",
  10 => "X",
  40 => "XL",
  50 => "L",
  90 => "XC",
  100 => "C",
  400 => "CD",
  500 => "D",
  900 => "CM",
  1000 => "M"
}.freeze

ROMAN_NUMBERS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].freeze

def roman_numeralize(number)
  return ROMAN_CHARACTERS[number] if ROMAN_CHARACTERS.key?(number)
  remaining = number

  ROMAN_NUMBERS.reduce("") do |numeral, value|
    num_value = remaining / value
    if num_value > 0
      remaining %= value
      numeral + (ROMAN_CHARACTERS[value] * num_value)
    else
      numeral
    end
  end
end
