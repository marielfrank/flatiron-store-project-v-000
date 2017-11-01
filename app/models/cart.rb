class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, :through => :line_items

    def total
        prices = items.collect do |item|
            item.price * quantity(item)
        end
        prices.reduce {|sum, price| sum + price}
    end

    def quantity(item)
        li = LineItem.find_by(cart_id: self.id, item_id: item.id)
        li.quantity
    end

    def add_item(item_id)
       li = LineItem.find_by(cart_id: self.id, item_id: item_id)
       if self.items.include?(li.try(:item))
           li.quantity += 1
           li
       else
           LineItem.new(cart_id: self.id, item_id: item_id)
       end
     end

     def checkout
       line_items.each do |i|
         item = Item.find(i.item_id)
         item.update(inventory: item.inventory - i.quantity)
       end
       self.line_items.clear
     end

end
