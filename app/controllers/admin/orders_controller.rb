class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
  end
  
  def update
  end
  
  private

  def order_params
   params.require(:order).permit(:customer_id,:shipping_postal_code,:shipping_address,:shipping_name,:postage,:billing_amount,:payment_method)
  end
end
