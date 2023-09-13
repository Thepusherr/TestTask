# Test Task: ()
# 1. Take each digit, from left to right and multiply them alternatively by 1 and 3
# 2. Sum those numbers
# 3. Take mod 10 of the summed figure
# 4. Subtract 10 and if the end number is 10, make it 0
# Example for 978014300723:
#   1. (9×1) + (7×3) + (8×1) + (0×3) + (1×1) + (4×3) + (3×1) + (0×3) + (0×1) + (7×3) + (2×1) + (3×3)
# 2. 86
# 3. 86 mod 10 = 6
# 4. 10 - 6 = 4
# Therefore the complete ISBN is: 9780143007234

class IsbnGenerator
  def initialize(params = {})
    converted_number(params[:number])
  end

  private

  def converted_number(number)
    raise "Wrong number!" unless number.is_a? Integer

    number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }.sum
    mod = number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }.sum.modulo(10)
    p res = number.to_s + (10 - mod).to_s
  end
end

IsbnGenerator.new(number: 978014300723)