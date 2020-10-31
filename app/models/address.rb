class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    varidates :zip_code, :city, :region_id, :building, :house_number, :phone_number
  end
end
