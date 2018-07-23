# bill.rb

def subtotal(prices)
  if prices.class != Array
    raise ArgumentError.new("subtotal requires an Array")
  end

  return prices.reduce(0, :+)
end


def tax(prices, tax_rate)
  return subtotal(prices) * tax_rate
end
