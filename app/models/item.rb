class Item < ApplicationRecord
  validates :title, :description, :image, :category, :condition, :delivery_fee, :shipping_location, :shipment_date, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :shipping_location_id, numericality: { other_than: 1 }
  validates :shipment_date_id, numericality: { other_than: 1 }


  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_location
  belongs_to_active_hash :shipment_date
end
