class IsbnGenerator
  def initialize(params = {})
    converted_number(params[:number])
  end

  private

  def converted_number(number)
    raise "Wrong number!" unless number.is_a? Integer

    number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }.sum
    sum = number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }.sum
    p res = number.to_s + ((10 - (sum % 10)) % 10).to_s
  end
end

IsbnGenerator.new(number: 978014300723)