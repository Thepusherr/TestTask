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