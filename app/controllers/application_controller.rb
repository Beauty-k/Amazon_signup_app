class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include SessionsHelper
  # include CurrentCart
  helper_method :current_cart

  def current_cart
    session[:cart_id] ||= Cart.create.id
    Cart.find(session[:cart_id])
  end
  # if current_user
  #   puts "User logged in: #{current_user.email}"
  # end
end
