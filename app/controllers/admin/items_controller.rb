class Admin::ItemsController < ApplicationController
  def new
   @item=Item.new
  end
  
  def create
  end

  def show
  end

  def edit
  end

  def index
   @items=Item.all
  end
  
  def update
  end
end
