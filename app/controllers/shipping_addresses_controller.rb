class ShippingAddressesController < ApplicationController
    before_action :authenticate_user
    before_action :set_shipping_adress, only: %i[edit,update,destroy]

    def index
        @shipping_addresses = current_user.shipping_addresses
    end

    def new
        @shipping_address = current_user.shipping_addresses.new
    end

    def create
        @shipping_address = current_user.shipping_addresses.new(shipping_address_params)
        if @shipping_address.save
            redirect_to shipping_addresses_path, notice: "Shipping address added successfully!"
        else
            flash[:alert] = "Shipping address could not be added!"
            render :new
        end
    end 

    def edit
        @shipping_address = current_user.shipping_addresses.find(params[:id])
    end

    def update
        @shipping_address = current_user.shipping_addresses.find(params[:id])
        if @shipping_address.nil?
             flash[:alert] = "Shipping address not found."
            redirect_to shipping_addresses_path and return
        end

        if @shipping_address.update(shipping_address_params)
            redirect_to shipping_addresses_path, notice: "shipping address updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @shipping_address = current_user.shipping_addresses.find(params[:id])
        if @shipping_address
            @shipping_address.destroy
            redirect_to shipping_addresses_path, notice: "shipping address deleted successfully!"
        else
            redirect_to shipping_addresses_path, notice: "Shipping address not found"
        end
    end

    private
    
    def set_shipping_address
        @shipping_address = current_user.shipping_addresses.find(params[:id])
    end

    def shipping_address_params
        params.require(:shipping_address).permit(:full_name, :phone_number, :address_line1, :address_line2, :city, :state, :country, :zip_code, :default)
    end
end
