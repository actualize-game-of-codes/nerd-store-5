class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:form_product_id])
    calculated_subtotal = params[:form_quantity].to_i * product.price
    calculated_tax = params[:form_quantity].to_i * product.tax
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:form_product_id],
      quantity: params[:form_quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end
