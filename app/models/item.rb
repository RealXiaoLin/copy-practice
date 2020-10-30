class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_location
  belongs_to_active_hash :shipment_date

  with_options presence: true do
    validates :title, :description, :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]{1,7}\z/}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :shipping_location_id
      validates :shipment_date_id
    end
  end
end
