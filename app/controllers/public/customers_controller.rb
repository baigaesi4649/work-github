class Public::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer =Customer.find(params[:id])
  end

  def update
  end
  
  def unsubscribe
  end
  
  def withdraw
  end  
  
  private
  def customers_params
   params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:address,:telephone_number,:is_deleted)
  end
end
