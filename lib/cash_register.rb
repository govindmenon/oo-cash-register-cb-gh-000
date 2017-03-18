class CashRegister
  attr_accessor :total,:discount
  attr_reader :title,:items,:last_item_price


  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price = 0
  end

  def add_item(title,price,quantity=nil)
    @title = title
    quantity ? @total += price*quantity : @total += price
    if quantity then
      quantity.times do
        @items << title
      end
    else
      @items << title
    end
    @last_item_price = price
  end

  def apply_discount
    if @discount then
      @total -= @discount*@total*0.01
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item_price
  end
end
