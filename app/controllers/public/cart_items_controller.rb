class Public::CartItemsController < ApplicationController
  def index
   @cart_items=current_customer.cart_items
   @total=0
  end
  
  def create
     @cart_item=CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     update_cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
     @cart_item.amount += update_cart_item.amount
     update_cart_item.destroy
     @cart_item.save
  else @cart_item.save
    #flash[:notice] = "You have updated user successfully."
  end
  redirect_to public_cart_items_path
  end
  
  def update
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @cart_item.amount += params[:cart_item][:item_id].to_i
    @cart_item.update(cart_item_params)
   #flash[:notice] = "You have updated user successfully."
    redirect_to public_cart_items_path
    end
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to public_cart_items_path
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
