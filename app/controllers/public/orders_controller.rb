class Public::OrdersController < ApplicationController
  def new
   @order=Order.new
  end
  
  def create
    @order = Order.new (order_params)
    @order.customer_id = current_customer_id
    if @order.save
     current_customer.cart_items.each do |cart|
     @order_detail = OrderDetail.new
     @order_detail.item_id=cart.item_id
     @order_detail.order_id=@order.id
     @order_detail.amount=cart.amount
     @order_detail.save
     end
    end
  end

  def index
  end

  def show
  end
  
  def complete
  end
  
  def confirm
    if params[:order][:select_address]==0
      
    elsif params[:order][:select_address]==1
      
    else params[:order][:select_address]==2
   
    end   
  end
  
  private

  def order_params
   params.require(:order).permit(:customer_id,:shipping_postal_code,:shipping_address,:shipping_name,:postage,:billing_amount,:payment_method,:is_active)
  end
end
