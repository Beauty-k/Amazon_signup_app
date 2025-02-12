class CartsController < ApplicationController
    before_action :authenticate_user
    def show
        @cart = current_cart
        @cart_counts = @cart.cart_items.count
    end
end
