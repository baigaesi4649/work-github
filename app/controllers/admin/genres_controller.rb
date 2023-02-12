class Admin::GenresController < ApplicationController
  def create
       @genre=Genre.new(genre_params)
    if @genre.save
      #flash[:notice] = "You have updated user successfully."
      redirect_to admin_item_path(:id)
    else
      render :admin_items_path
    end
  end
  
  def index
   @genres=Genre.all
  end

  def edit
  end
  
  def update
  end

private
def genre_params
 params.require(:genre).permit(:name)
end


end