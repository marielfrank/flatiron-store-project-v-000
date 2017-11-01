class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, :through => :line_items

    def total
        prices = items.collect {|item| item.price}
        prices.reduce {|sum, price| sum + price}
    end

    # def add_item(item_id)
    #     item = Item.find_by(id: item_id)
    #     li = LineItem.find_by(cart_id: self.id, item_id: item.id)
    #     if li
    #         li.quantity += 1
    #     else
    #         li = LineItem.new(cart_id: self.id, item_id: item.id)
    #     end
    #     li
    # end

    def add_item(item_id)
       li = LineItem.find_by(cart_id: self.id, item_id: item_id)
       if items.include?(li.try(:item))
           li.update(quantity: (li.quantity + 1))
           li
       else
           line_items.new(item_id: item_id)
       end
     end

     def checkout
       line_items.each do |i|
         item = Item.find(i.item_id)
         item.update(inventory: item.inventory - i.quantity)
       end
     end

end
