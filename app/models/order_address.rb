class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :city, :region_id, :building, :house_number, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    # addressモデルのバリデーション
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :region_id, numericality: { other_than: 1 , message: 'を選択してください'} # 都道府県
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } # 市区町村
    validates :house_number # 番地
    validates :phone_number, format: { with: /\A0[0-9]{10,11}\z/ } # 電話番号
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # tokenのバリデーション
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, city: city, region_id: region_id, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
