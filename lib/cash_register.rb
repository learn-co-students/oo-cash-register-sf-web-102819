require 'pry'

class CashRegister
    @@total = []
    attr_accessor :total, :discount, :items

    def initialize(discount= 0)
        @total = 0
        @discount = discount
        @items = []
        
    end
    
    # def discount 
    #     @total = 20
    # end

    def add_item(item, value, amount = 0)
        if amount != 0
            @total += value * amount
            amount.times do 
                @items << item
            end
            @@total << value * amount
        else 
            @total += value
            @items << item
            @@total << value
        end

    end

    def apply_discount
        if @discount > 0
            @total  = @total - 200
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total = @total - @@total.last
    end
    
end