class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_item_access, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address_form = OrderAddressForm.new
  end

  def create
    @order_address_form = OrderAddressForm.new(order_params)
    if @order_address_form.valid?
      pay_item # 支払い処理
      @order_address_form.save
      return redirect_to root_path
      
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index
    end
  end

  private

  def order_params  
    params.require(:order_address_form).permit(
      :post_code, :prefecture_id, :municipalities, :address_line1, 
      :address_line2, :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def check_item_access
    # 自身が出品した商品、または売却済み商品の場合はトップページにリダイレクト
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,          # 商品の価格
      card: order_params[:token],  # カードトークン
      currency: 'jpy'              # 日本円
    )
  end
end
