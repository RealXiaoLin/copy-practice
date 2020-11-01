class Address < ApplicationRecord
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region

  belongs_to :order
end
