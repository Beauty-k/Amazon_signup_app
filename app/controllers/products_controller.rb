class ProductsController < ApplicationController
  def index
    if params[:search].present?
      search_term = params[:search].downcase
      @products = Product.all.select { |product| product.name.downcase.include?(search_term) }
      #@products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
