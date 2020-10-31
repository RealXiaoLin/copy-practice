class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: [:show, :edit, :update]

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
    if current_user != @item.user
      redirect_to item_path(@item)
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      redirect_to edit_item_path(@item)
    end
  end


  private

  def find_item
     @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :delivery_fee_id, :shipping_location_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end
end
