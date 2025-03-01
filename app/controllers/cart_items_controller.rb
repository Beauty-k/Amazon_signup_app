class CartItemsController < ApplicationController
    before_action :set_cart
    # before_action :initialize_cart

    def index
        @cart_items = @cart.cart_items
    end

    def create
        product = Product.find(params[:product_id])
        @cart = current_cart
        cart_service = CartService.new(@cart,product)
       
        if cart_service.add_product
            flash[:success] = "product added to the cart"
            redirect_to cart_path
        else
            flash[:error] = "could not add product to cart"
            redirect_to root_path
        end
    end

    def destroy
        cart_service = CartService.new(@cart,nil)

        if cart_service.remove_product(params[:id])
            flash[:success] = "product removed from cart"
        else
            flash[:error] = "product not found"
        end
        redirect_to cart_path
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
