module ApplicationHelper < ActionController::Base
    helper_method :current_cart

    def current_cart
        session[:cart_id] ||= Cart.create.id
        cart.find(session[:cart_id])
    end

end
