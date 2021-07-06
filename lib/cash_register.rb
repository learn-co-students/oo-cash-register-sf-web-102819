
class CashRegister
    attr_accessor :total, :items
    def initialize(discount = 0)
        @total = 0
        @discount = discount
    end

    def discount
        @discount
    end

    def add_item(item, price, quantity=1)
        @total += price *quantity
        count = quantity
        count.times do 
            if @items == nil
                 @items = [item]
            else 
                 @items.push(item)
            end
        end
        @last = price * quantity
    end

    def apply_discount
        if discount != 0
            @total = (@total * (0.01 * (100-@discount))).to_i
            p "After the discount, the total comes to $#{@total}."
        else
            p "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total -@last
    end
end