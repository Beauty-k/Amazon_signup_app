class CartItemsController < ApplicationController
    before_action :set_cart
    # before_action :initialize_cart

    def index
        @cart_items = @cart.cart_items
    end

    def create
        product = Product.find(params[:product_id])
        cart_service = CartService.new(current_cart,product)
       
        if cart_service.add_product
            redirect_to cart_path, notice: "product added to the cart"
        else
            redirect_to root_path, notice: "could not add product to cart"
        end
    end

    def destroy
        cart_service = CartService.new(current_cart,nil)

        if cart_service.remove_product(params[:id])
            redirect_to cart_path, notice: "product removed from cart"
        else
            redirect_to cart_path, notice: "product not found"
        end
    end


    private

    def set_cart
        @cart = current_cart 
    end

    # def initialize_cart
    #     product = Product.find_by(id: params[:product_id])
    #     cart_service = CartService.new(@cart, product)
    # end
end
