class ProductsController < ApplicationController
  def index
    if session[:count] == nil
      session[:count] = 0
    else
      session[:count] += 1
    end
    @visit_count = session[:count]

    sort_attribute = params[:input_sort_attribute]
    sort_order = params[:input_sort_order]
    discounted = params[:input_only_discounted]

    if discounted
      @products = Product.where("price < ?", 100)
    else
      @products = Product.all
    end

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    end
    render "index.html.erb"
  end

  def new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      # image: params[:image],
      price: params[:price],
      supplier_id: params[:supplier_id]
    )
    Image.create(
      url: params[:image],
      product_id: @product.id
    )
    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end
end
