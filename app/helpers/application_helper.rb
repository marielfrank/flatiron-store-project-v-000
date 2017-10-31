module ApplicationHelper
    def priceize(price)
        number_to_currency(price/100)
    end
end
