class Public::AddressesController < ApplicationController
  def index
    @addresses=Address.all
  end

  def edit
    @address = current_customer
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new (address_params)
    @address.customer_id = current_customer.id
    if @address.save
    #flash[:notice] = "You have created book successfully."
    redirect_to public_addresses_path
    end
  end
  
  def update
    @address = current_customer
    if @address.update(address_params)
    #flash[:notice] = "You have updated user successfully."
    redirect_to public_addresses_path
    else
    render :edit
    end
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
end
