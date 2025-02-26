class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable
    has_one :cart, dependent: :destroy
    has_many :checkouts

    after_create :create_cart
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true
    
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    private

    def create_cart
        Cart.create(user: self)
    end
end

