class Admin::GenresController < ApplicationController
  def create
  end
  
  def index
   @genres=Genre.all
  end

  def edit
  end
  
  def update
  end
end
