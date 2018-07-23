# tax_spec.rb
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
    expect(sub).must_be_close_to 0.96, 0.01
  end

  it "will not allow a negative tax rate" do
    # Arrange
    prices = [3, 4, 5]
    tax_rate = - 0.01

    # Act-Assert
    expect {
      tax(prices, tax_rate)
    }.must_raise ArgumentError
  end

  it "will return 0 for an empty array" do

    # Arrange
    prices = []

    # Act
    sub = tax(prices, 0.08)

    # Assert
    expect(sub).must_equal(0)
  end

  it "will raise an error for a non-array argument" do
    # Arrange
    prices = "not an array"
    tax_rate = 0.1

    # Act-Assert

    expect {
      tax(prices, tax_rate)
    }.must_raise ArgumentError

    # Arrange
    prices = []
    tax_rate = "not a number"

    # Act-Assert
    expect {
      tax(prices, tax_rate)
    }.must_raise ArgumentError

  end

  it "if the total bill is negative (refund), sales tax is 0" do
    # Arrange
    prices = [-20]
    tax_rate = 0.08

    # Act
    tax = tax(prices, tax_rate)

    # Assert
    expect(tax).must_equal 0
  end
end
