class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_transaction
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @last_transaction = {price: price, quantity: quantity}
    while quantity >= 1
      @items << title
      quantity -= 1
    end
  end

  def apply_discount
    if(discount == 0)
      "There is no discount to apply."
    else
      @total -= @total * (discount.to_f / 100)
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
    @total -= last_transaction[:price] * last_transaction[:quantity]
  end
end
