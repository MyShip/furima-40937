class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  
  def index
    @item = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def create_params
    params.require(:item).permit(:name, :explanation, :price, :image, :category_id, :situation_id, :load_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
