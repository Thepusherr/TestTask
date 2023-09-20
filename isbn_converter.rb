class InvalidISBNError < StandardError
end

class IsbnConverter
  def convert_to_isbn13(number)
    raise InvalidISBNError, "Value must be 12-digit number!" unless number.to_s =~ /^\d{12}$/

    sum = number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }.sum
    "#{number}#{((10 - (sum % 10)) % 10)}".to_i
  end
end

isbn_converter = IsbnConverter.new
p isbn_converter.convert_to_isbn13(978014300723)