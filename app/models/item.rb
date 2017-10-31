class Item < ActiveRecord::Base
    has_many :categories
    has_many :line_items
    has_many :carts, :through => :line_items

    def self.available_items
        self.detect {|item| !!item.inventory }
    end
end
