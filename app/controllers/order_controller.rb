class OrderController < ApplicationController
    before_action :authenticate_user
    before_action :set_order, only [:show, :cancel]

    def index
        @orders = current_user.orders.order(created_at: :desc)
    end

    def show
       
    end

    def cancel
        if @order.pending?
            @order.update(status: "canceled")
            redirect_to orders_path, notice: "Order canceled successfully."
        else
            redirect_to orders_path, notice: "Order can't be canceled now."
        end
    end

    private

    def set_order
        @orders = current_user.orders.find(params[:id])
        redirect_to orders_path, alert: "Order not found." unless @order
    end
end

