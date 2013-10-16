class OrdersController < ApplicationController
  before_action :signed_in_user
  layout 'order_panel'

  def select_time
    @order = Order.new
    @order.rent_id = params[:rent_id]
    @rent = Rent.find(params[:rent_id])
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.rent = Rent.find(params[:order][:rent_id])
    if @order.save!
      flash[:success] = "预订成功，请尽快与车主联系！"
      redirect_to @order
    else
      redirect_to rents_url
    end
  end

  def show
    @order = Order.find(params[:id])
    @rent = @order.rent
    @car = @rent.car
  end
  
  def check_out
    @order = current_user.orders.find(params[:order_id])
    @order.rent.status = 'done'
    @order.done = true
    @order.rent.save
    @order.save
  end

  def my_order
    @orders = current_user.orders
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = "订单已取消！"
    redirect_to my_orders_url
  end

  def order_params
    params.require(:order).permit(:rent_id, :start, :end)
  end

end
