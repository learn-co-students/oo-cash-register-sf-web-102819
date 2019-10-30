class CashRegister
    attr_reader :discount
    attr_accessor :total, :items_array, :prices_array

    def initialize(discount = 0)
        @@prices_array = []
        @@items_array = []
        @total = 0
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times { @@items_array << title }
        @@prices_array << (price * quantity)
    end

    def apply_discount
        if discount != 0
            self.total -= (total * discount/100)
        "After the discount, the total comes to $#{self.total}."
        else
        "There is no discount to apply."
        end
    end

    def items
        @@items_array
    end

    def void_last_transaction
        if @@items_array.length > 0
            @total -= @@prices_array.last
        else 
            @total = 0.0
        end
        @total
    end
    
end
