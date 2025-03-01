class CartCreationService
    def self.create_for(user)
        Cart.create(user: user)
    end
end

