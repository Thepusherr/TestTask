require 'rspec/autorun'
require_relative 'isbn_converter.rb'

describe IsbnConverter do
    it "generate correct isbn" do
        isbn_converter = IsbnConverter.new
        expect(isbn_converter.convert_to_isbn13(978014300723)).to eq(9780143007234)
    end

    it "convert numbers to isbn format" do
        isbn_converter = IsbnConverter.new
        expect(isbn_converter.numbers_to_isbn13([978014300723])).to eq([9780143007234])
    end
end
