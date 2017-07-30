class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.html.erb"
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:form_product_id],
      quantity: params[:form_quantity],
      status: "carted"
    )
    carted_product.save
    redirect_to "/carted_products"
  end
end
