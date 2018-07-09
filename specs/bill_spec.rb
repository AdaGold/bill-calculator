# bill_spec.rb
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/bill'

describe "Bill" do

  before do
    @bill = Bill.new([4.75, 8.75])
  end

  it "can be created" do
    # the class of @bill should be Bill
    @bill.class.must_equal Bill
  end

  it "will raise an error if created without a list of prices" do
    proc {
      Bill.new
    }.must_raise ArgumentError
    proc {
      Bill.new([])
    }.must_raise ArgumentError
    proc {
      Bill.new(1)
    }.must_raise ArgumentError
  end

  it "can calculate the total price including tax" do
    # Act
    total = @bill.total

    # Assert
    total = @bill.total.must_equal @bill.subtotal + @bill.tax
  end

  it "can calculate the proper subtotal" do
    # Arrange
    @bill = Bill.new([4.75, 8.75])

    # Act
    subtotal = @bill.subtotal

    # Assert
    expect(subtotal).must_equal 13.50
  end

  it "can calculate the proper tax assuming 8% tax" do

    bill = Bill.new([4.75, 8.75])

    # Act
    tax = bill.tax

    # Assert
    expect(tax).must_equal bill.subtotal * 0.08
  end
end
