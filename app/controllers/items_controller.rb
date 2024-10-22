class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :destroy]
  before_action :move_to_index,      only: [:edit, :update, :destroy] 
  before_action :set_item, only: [:show, :edit]

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
  
  def show
    
  end

  def edit
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(create_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy

  end
  private
  def create_params
    params.require(:item).permit(:name, :explanation, :price, :image, :category_id, :situation_id, :load_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
