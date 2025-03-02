class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include SessionsHelper
  include CurrentCart
 
  
  def authenticate_user
    unless user_signed_in?
      redirect_to login_path, notice: "you need to signin to access this page"
    end
  end

  def user_signed_in?
    session[:user_id].present?
  end

  # private

  # def set_cart
  #   @cart = current_cart
  # end

  def set_cart_count
    @cart_count = current_user.cart_items.sum(:quantity) if user_signed_in?
  end
end
