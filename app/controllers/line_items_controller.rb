class LineItemsController < ApplicationController
  def create
    @user = current_user

    if !!@user.current_cart
      current_cart = @user.current_cart
      line_item = current_cart.add_item(params[:item_id])
      line_item.save
      current_cart.save
      @user.save
    else
      @user.current_cart = @user.carts.create
      current_cart = @user.current_cart
      line_item = current_cart.add_item(params[:item_id])
      line_item.save
      current_cart.save
      @user.save
    end
    redirect_to cart_path(current_cart)
  end
end
