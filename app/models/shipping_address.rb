class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :full_name, :phone_number, :address_line1, :address_line2, :city, :state, :zip_code, :country, presence: true

  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits"} 
  validates :zip_code, format: { with: /\A\d{5,6}\z/, message: "must be 5 or 6 digits"}

  before_save :ensure_only_one_default

  private

  def ensure_only_one_default
    
    return unless default

    user.shipping_addresses.excluding(self).update_all(default: false)
  end

end
