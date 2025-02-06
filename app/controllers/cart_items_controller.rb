class CartItemsController < ApplicationController
    before_action :set_cart

    def index
        @cart_items = CartItem.all
    end
    def create
        logger.debug "Params: #{params.inspect}"
        product = Product.find(params[:product_id])
        cart_item = @cart.cart_items.find_by(product: product)

        if cart_item
            cart_item.increment(:quantity)
        else
            cart_item = @cart.cart_items.build(product: Product, quantity: 1)
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
        cart_item = @cart.cart_items.find(params[:id])
        cart_item.destroy
        flash[:success] = "product removed from cart"
        redirect_to cart_path(@cart)
    end
    private

    def set_cart
        @cart = current_cart
    end
end
