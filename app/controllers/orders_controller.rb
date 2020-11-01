class OrdersController < ApplicationController
before_action :authenticate_user!


def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    # binding.pry
    if @order_address.valid?
      pay_time
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def address_params
    params.permit(:zip_code, :city, :region_id, :house_number, :building, :phone_number, :token).merge(item_id: params[:item_id] ).merge(user_id: current_user.id)
  end




  def pay_time
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
      )
  end

end
