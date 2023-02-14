class Public::CartItemsController < ApplicationController
  def index
   @cart_items=current_customer.cart_items
  end
  
  def create
     @cart_item=CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
  if @cart_item.save
    #flash[:notice] = "You have updated user successfully."
    redirect_to public_cart_items_path
  end
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
  def destroy_all
   #current_user.cart_items.destroy_all
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
