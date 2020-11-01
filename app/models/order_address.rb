class OrderAddress < ApplicationRecord

include ActiveModel::Model
attr_accessor :zip_code, :city, :region_id, :building, :house_number, :phone_number, :item_id, :user_id

end
