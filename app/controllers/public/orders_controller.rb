class Public::OrdersController < ApplicationController
  def new
   @order=Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:select_address].to_i==0
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address].to_i==1
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name
    else
      @order.shipping_postal_code = @order.shipping_postal_code
      @order.shipping_address = @order.shipping_address
      @order.shipping_name = @order.shipping_name      
    end   
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
     current_customer.cart_items.each do |cart|
     @order_detail = OrderDetail.new
     @order_detail.item_id=cart.item_id
     @order_detail.purchase_price=cart.item.price
     @order_detail.order_id=@order.id
     @order_detail.amount=cart.amount
     @order_detail.save
     end
     current_customer.cart_items.destroy_all
     redirect_to complete_public_orders_path
  end

  def index
    @orders=Order.all
  end

  def show
    @order=current_customer
    @order=Order.find(params[:id])
  end
  
  def complete
  end
  
  private

  def order_params
   params.require(:order).permit(:customer_id,:shipping_postal_code,:shipping_address,:shipping_name,:postage,:billing_amount,:payment_method)
  end
end
