class IsbnGenerator
  def initialize(params = {})
    converted_number(params[:number])
  end

  private

  def converted_number(number)
    number = number.to_s.gsub(/\D/, '')

    raise "Wrong number!" if number.blank? || number.length != 12

    sum = number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }.sum
    p "#{number}#{((10 - (sum % 10)) % 10)}"
  end
end

IsbnGenerator.new(number: 978014300723)
