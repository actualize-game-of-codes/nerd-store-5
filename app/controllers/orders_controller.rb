class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: params[:form_user_id],
      product_id: params[:form_product_id],
      quantity: params[:form_quantity],
      subtotal: params[:form_subtotal],
      tax: params[:form_tax],
      total: params[:form_total]
    )
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end
