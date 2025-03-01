class CartService
    def initialize(cart, product)
        @cart = cart
        @product = product
    end
   
    def add_product
            cart_item = @cart.cart_items.find_by(product: @product)
        if cart_item
            cart_item.quantity += 1
            return cart_item if cart_item.save
        else
            new_cart_item = @cart.cart_items.create(product:@product, quantity: 1)
            return new_cart_item if new_cart_item.persisted?
        end
        nil
        
    end

    def remove_product(cart_item_id)
        cart_item = @cart.cart_items.find_by(id: cart_item_id)
        return false unless cart_item

        cart_item.destroy
        true
    end
end