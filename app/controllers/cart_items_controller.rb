class CartItemsController < ApplicationController
    before_action :set_cart

    def index
        @cart_items = @cart.cart_items
    end
    def create
        product = Product.find(params[:product_id])
        cart_item = @cart.cart_items.find_by(product: product)           
        if cart_item
            cart_item.increment!(:quantity)
        else
            cart_item = @cart.cart_items.build(product: product, quantity: 1)
        end

        if cart_item.save
            flash[:success] = "product added to the cart"
            redirect_to cart_path(@cart)
        else
            flash[:error] = "could not able to add product to cart"
            redirect_to root_path
        end
    end

    def destroy
        cart_item = @cart.cart_items.find_by(id: params[:id])
        # cart_item = CartItem.find_by(id: params[:id])
        if cart_item
            cart_item.destroy
            flash[:success] = "product removed from cart"
        else
            flash[:error] = "product not found"
        end
        redirect_to cart_path(@cart)
    end
    private

    def set_cart
        @cart = current_cart
    end
end
