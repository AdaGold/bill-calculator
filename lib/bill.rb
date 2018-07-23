# bill.rb

require 'awesome_print'

def subtotal(prices)
  if prices.class != Array
    raise ArgumentError.new("subtotal requires an Array")
  end

  return prices.reduce(0, :+)
end


def tax(prices, tax_rate)
  if tax_rate < 0 || (tax_rate.class != Integer && tax_rate.class != Float)
    raise ArgumentError.new("Illegal tax rate")
  end
  tax = subtotal(prices) * tax_rate
  return tax >= 0 ? tax : 0
end


def total(menu_items, tax_rate)  
  prices = menu_items.map do |menu_item|
    if menu_item[:price] === nil
      raise ArgumentError.new("Menu Items must have a price")
    end
    menu_item[:price]
  end

  return subtotal(prices) + tax(prices, tax_rate)
end
