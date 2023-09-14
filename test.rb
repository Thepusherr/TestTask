require 'rspec/autorun'
require_relative 'isbn_converter.rb'

describe Calculator do
    it "add two numbers" do
        calc = Calculator.new
        expect(calc.add(3, 4)).to eq(7)
    end
end
