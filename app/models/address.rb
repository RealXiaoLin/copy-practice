class Address < ApplicationRecord
  attr_accessor :token
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region


  belongs_to :order

  with_options presence: true do
    validates :zip_code, :city, :region_id, :building, :house_number, :phone_number
  end
end
