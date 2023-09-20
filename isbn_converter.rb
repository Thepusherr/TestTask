class InvalidISBNError < StandardError
end

class IsbnConverter
  # Convert number to isbn13 format
  def convert_to_isbn13(number)
    raise InvalidISBNError, "Value must be 12-digit number!" unless number.to_s =~ /^\d{12}$/

    multiply_digits = multiply_digits(number)
    calculate_check_digit(number, multiply_digits.sum)
  end

  # Convert numbers to isbn13 format
  def numbers_to_isbn13(numbers)
    numbers.select! { |number| number.to_s =~ /^\d{12}$/ }
    numbers.map { |number| convert_to_isbn13(number) }
  end

  private

  # Loop through each digit from left to right and multiply them alternatively by 1 and 3
  def multiply_digits(number)
    number.to_s.split("").map.with_index { |digit, index| index.even? ? digit.to_i : digit.to_i * 3 }
  end

  # Calculate the check digit
  def calculate_check_digit(number, sum)
    "#{number}#{((10 - (sum % 10)) % 10)}".to_i
  end
end

p IsbnConverter.new.convert_to_isbn13(978014300723)