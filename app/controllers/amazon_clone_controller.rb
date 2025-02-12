class AmazonCloneController < ApplicationController
  def index
  end
  def render_products
    render 'amazon_clone/office_product'
  end

end
