class OrdersController < ApplicationController
  
  layout "merchant"

  def index
    @products = Product.all
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.create(order_params)
    redirect_to orders_path
  end

  private
    def order_params
      params.require(:order).permit(:quantity,:total_price,:status)
    end

end
