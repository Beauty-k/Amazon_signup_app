module CurrentCart
    extend ActiveSupport::Concern

    included do
        helper_method :current_cart
    end

    def current_cart
        # session[:cart_id] ||= Cart.create.id
        # Cart.find(session[:cart_id])
        if session[:cart_id].present? && Cart.exists?(session[:cart_id])
            Cart.find(session[:cart_id])
        else
            cart = Cart.create(user: current_user)
            session[:cart_id] = cart.id
            cart
        end
    end
    
end