class Admin::ItemsController < ApplicationController
  def new
   @item=Item.new
   @items=Item.all
  end
  
  def create
     @item=Item.new(item_params)
     @item.save
     #flash[:notice] = "You have updated user successfully."
     redirect_to admin_item_path(@item.id)
  end

  def show
    @item =Item.find(params[:id])
  end

  def edit
  end

  def index
   @items=Item.all
  end
  
  def update
  end
private

def item_params
 params.require(:item).permit(:genre_id,:name,:introduction,:price,:is_active)
end

end
