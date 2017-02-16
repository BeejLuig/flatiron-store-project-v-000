class ItemsController < ApplicationController
  def show
    @item = Item.find_by_id(params[:id])
  end
end
