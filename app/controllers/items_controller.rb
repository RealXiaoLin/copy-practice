class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :delivery_fee_id, :shipping_location_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end
end
