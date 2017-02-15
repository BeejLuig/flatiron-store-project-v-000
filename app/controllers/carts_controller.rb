class CartsController < ApplicationController
  def show
    @cart = Cart.find_by_id(params[:id])
  end

  def checkout
    @cart = Cart.find_by_id(params[:id])
    @cart.status = "submitted"
    @cart.items.each_with_index do |item, index|
      item.inventory -= @cart.line_items[index].quantity
      item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end
end
