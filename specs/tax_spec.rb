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
      sub = tax(prices, tax_rate)
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

  end

  it "if the total bill is negative (refund), sales tax is 0" do

  end
end
