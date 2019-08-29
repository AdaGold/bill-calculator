# subtotal_test.rb

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative '../lib/bill'

describe "subtotal" do
  it "can calculate an accurate subtotal" do
    # Arrange
    prices = [3, 4, 5]

    # Act
    sub = subtotal(prices)

    # Assert
    expect(sub).must_equal 12
  end

  it "also works with floating point numbers" do
    # Arrange
    prices = [3.5, 4.4, 5.1]

    # Act
    sub = subtotal(prices)

    # Assert
    expect(sub).must_be_close_to 13.0, 0.1
  end

  it "will return 0 for an empty array" do
    # Arrange
    prices = []

    # Act
    sub = subtotal(prices)

    # Assert
    expect(sub).must_equal 0
  end

  it "will raise an error for a non-array argument" do
    # Arrange
    prices = "not-an-array"

    # Act-Assert
    expect {
      subtotal(prices)
    }.must_raise ArgumentError
  end

end
