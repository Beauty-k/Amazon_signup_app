class CartsController < ApplicationController
    before_action :authenticate_user
    before_action :set_cart
    def show
        @cart = current_cart
        # if @cart.present?
        #     @cart_counts = @cart.cart_items.count
        # end
    end

    def destroy
        @cart.destroy
        session[:cart_id] = nil
        redirect_to root_path, notice: "Cart was emptied successfully!"
    end

    # private

    # def set_cart
    #     @cart = current_cart
    # end
end
