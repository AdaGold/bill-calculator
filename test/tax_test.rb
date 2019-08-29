# tax_test.rb
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative '../lib/bill'

describe "tax" do
  it "can calculate an accurate sales tax" do
    # Arrange
    prices = [3, 4, 5]

    # Act
    sub = tax(prices, 0.08)

    # Assert

  end

  it "also works with floating point numbers" do


  end

  it "will return 0 for an empty array" do

  end

  it "will raise an error for a non-array argument" do

  end

  it "if the total bill is negative (refund), sales tax is 0" do

  end
end
