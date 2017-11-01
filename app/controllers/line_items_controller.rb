class LineItemsController < ApplicationController
  def create
    if !!current_cart
      cart = current_cart
    else
      cart = current_user.carts.create
    end
    li = cart.add_item(params[:item_id])
    cart.save
    li.save
    redirect_to cart_path(cart)
  end
end
