module Current_cart
    extend ActiveSupport::Concern

    included do
        helper_method :current_cart
    end

    def current_cart
        session[:cart_id] ||= Cart.create.id
        Cart.find(session[:cart_id])
    end
    
end