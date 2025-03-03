class CartsController < ApplicationController
    before_action :authenticate_user
  
    def show
        @cart = current_cart
        @cart_counts = @cart.cart_items.count
        
    end

    def destroy
        @cart.destroy
        session[:cart_id] = nil
        redirect_to root_path, notice: "Cart was emptied successfully!"
    end

end
