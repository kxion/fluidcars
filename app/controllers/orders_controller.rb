class OrdersController < ApplicationController
  before_filter :signed_in_user

  def create
    @order = current_user.orders.build
    @order.info_id = params[:info_id]
    status = @order.info.status
    if (status == 'active')
      @order.info.status = 'booked'
      @order.save
      @order.info.save
      redirect_to order_path(order_id: @order.id)
    else
      redirect_to infos_path
    end
  end

  def show
    @order = Order.find(params[:order_id])
  end
  
  def check_out
    @order= Order.find(params[:order_id])
    @order.info.status = 'done'
    @order.done = true
    @order.info.save
    @order.save
  end

end
