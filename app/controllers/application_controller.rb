class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart
  helper_method :price_to_currency

  def current_cart
    if current_user
      current_user.current_cart
    else
      nil
    end
  end

  def price_to_currency(price, quantity = 1)
    if quantity > 1
      "$%0.2f" % (price.to_f * quantity / 100)
    else
      "$%0.2f" % (price.to_f / 100)
    end
  end
end

#"$%0.2f" % (line_item.item.price.to_f * line_item.quantity / 100
