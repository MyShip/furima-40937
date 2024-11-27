class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_address_form = OrderAddressForm.new
  end

  def create
    @order_address_form = OrderAddressForm.new(order_params)
    if @order_address_form.valid?
      pay_item # 支払い処理
      @order_address_form.save
      return redirect_to root_path
      
    else
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


  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_c27c4036352c946ee8cefcf9"
    Payjp::Charge.create(
      amount: @item.price,          # 商品の価格
      card: order_params[:token],  # カードトークン
      currency: 'jpy'              # 日本円
    )
  end
end
