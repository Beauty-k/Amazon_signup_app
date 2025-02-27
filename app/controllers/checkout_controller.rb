class CheckoutController < ApplicationController
    before_action :authenticate_user

    # def index
    #     # @checkouts = current_user.checkouts
    # end
    def new
        @checkout = current_user.checkouts.new
        # @checkout = current_user.build_checkout
    end
    #Show checkout page
    def show
        @cart = current_user.cart
        # @order = Order.new
        @shipping_address = ShippingAddress.new
    end

    #Place order
    def create
        cart = current_user.cart
        total_price = cart.cart_items.sum{|item| item.product.price * item.quantity}
        order = current_user.orders.create!(total_price: total_price, status: "pending")
        
        payment = Razorpay::Order.create(amount: (total_price * 100).to_i, currency: 'INR')
        order.update(payment_id: payment.id)
        redirect_to payment_path(payment.id)

        #save address
        shipping_address = order.build_shipping_address(shipping_address_params)
        shipping_address.user = current_user
        shipping_address.save!

        #Transfer cart_items to order_items
        cart.cart_items.each do |cart_item|
            order.order_items.create!(
                product: cart_item.product,
                quantity: cart_item.quantity,
                price: cart_item.product.price
            )
        end

        # Empty the cart
        cart.cart_items.destroy_all

        redirect_to order_path(order), notice: "Order placed successfully!"

    end 
end
