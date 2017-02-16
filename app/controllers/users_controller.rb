class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    unless user_signed_in? && @user == current_user
      flash[:notice] = "Access denied."
      redirect_to store_path
    end
  end
end
