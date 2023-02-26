class Public::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = current_customer
   if @customer.update(customers_params)
   #flash[:notice] = "You have updated user successfully."
   redirect_to public_customers_my_page_path
   else
   render :edit
   end
  end
  
  def unsubscribe
  end
  
  def withdraw
   @customer = current_customer
   @customer.update(is_deleted: true)
   reset_session
   redirect_to root_path
  end  
  
  private
  def customers_params
   params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:address,:telephone_number,:is_deleted)
  end
end
