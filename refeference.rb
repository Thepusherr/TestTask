def calculate_isbn13_check_digit(isbn)
  # Remove any non-digit characters from the input
  isbn = isbn.gsub(/\D/, '')

  # Check if the input is valid
  if isbn.length != 12
    puts "Invalid ISBN13 input. It should be 12 digits long."
    return nil
  end

  # Initialize variables
  sum = 0
  multiplier = 1

  # Loop through each digit from left to right and multiply them alternatively by 1 and 3
  isbn.chars.each do |digit|
    sum += digit.to_i * multiplier
    multiplier = 4 - multiplier # Alternate between 1 and 3
  end

  # Calculate the check digit
  check_digit = (10 - (sum % 10)) % 10

  # Return the complete ISBN13
  return "#{isbn}#{check_digit}"
end

# Example usage:
isbn = "978014300723"
result = calculate_isbn13_check_digit(isbn)
puts "Complete ISBN13: #{result}"
