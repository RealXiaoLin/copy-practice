class ItemsController < ApplicationController
  def index
  end


  private
  def message_params
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :delivery_fee_id, :shipping_location_id, :shipment_date_id).merge(user_id: current_user.id)
  end
end
