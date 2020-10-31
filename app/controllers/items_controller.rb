class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(updated_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user != @item.user || @item.order != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

 def destroy
  if @item.user == current_user
    @item.destroy
    redirect_to root_path
  else
    redirect_to item_path(@item)
  end



  private

  def find_item
     @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :delivery_fee_id, :shipping_location_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end
end
