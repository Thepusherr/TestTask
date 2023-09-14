require 'rspec/autorun'
require_relative 'isbn_generator.rb'

describe IsbnGenerator do
    it "generate correct isbn" do
        correct_isbn = IsbnGenerator.new(number: 978014300723)
        expect(correct_isbn.to eq(9780143007234))
    end
end
