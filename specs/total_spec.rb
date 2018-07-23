# total_spec.rb

require_relative '../lib/bill'

describe "total" do
  it "will calculate the total resturant bill" do
    # Arrange
    bill_items = [
      {item: "Cesar Salad", price: 31},
      {item: "Tacos", price: 14},
      {item: "Ice Tea", price: 2.95},
      {item: "Coke", price: 0.99}
    ]

    # Act
    total_bill = total(bill_items, 0.08)

    # Assert
    expect(total_bill).must_be_close_to 52.85, 0.01
  end

  it "returns 0 for an empty bill" do
    # Arrange
    bill_items = [
    ]

    # Act
    total_bill = total(bill_items, 0.08)

    # Assert
    expect(total_bill).must_equal 0
  end

  it "includes 0 tax for a refund" do
    # Arrange
    bill_items = [
      {item: "Cesar Salad", price: -31},
      {item: "Tacos", price: -14},
      {item: "Ice Tea", price: -2.95},
      {item: "Coke", price: -0.99}
    ]

    # Act
    total_bill = total(bill_items, 0.08)

    # Assert
    expect(total_bill).must_be_close_to -48.94, 0.01
  end

end
