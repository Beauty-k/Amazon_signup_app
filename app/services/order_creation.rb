
class OrderCreationService
    def initialize(user)
        @user = user
        @cart = user.cart
    end

    def call
        return {success: false, message: "Your cart is empty."} if @cart.cart_items.empty?
        ActiveRecord::Base.transaction do
            order = @user.orders.create!(
                total_price: calculate_total_price,
                status: "pending"
            )
            create_order_items(order)
            clear_cart
           
            return {success: true, order: order}
        end
        rescue StandardError => e
            return {success: false, message: e.message}
        end
    end

    private

    def calculate_total_price
        @cart.cart_items.sum{|item| item.product.price *item.quantity}
    end

    def create_order_items(order)
        @cart.cart_items.each do |cart_item|
            order.order_items.create!(
                product: cart_item.product,
                quantity: cart_item.quantity,
                price: cart_item.product.price
            )
        end
    end

    def clear_cart
        @cart.cart_items.destroy_all
    end
end
