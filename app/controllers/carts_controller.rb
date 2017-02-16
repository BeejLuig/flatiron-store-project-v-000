class CartsController < ApplicationController
  def show
    @cart = Cart.find_by_id(params[:id])
  end

  def checkout
    @cart = Cart.find_by_id(params[:id])
    @cart.status = "submitted"
    
    @cart.update_item_inventory

    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end
end
