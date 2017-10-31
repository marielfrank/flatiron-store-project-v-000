module ApplicationHelper
    def priceize(price)
        number_to_currency(price/100)
    end

    def current_cart
        current_user.current_cart
    end
end
