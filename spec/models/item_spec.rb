require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "#create" do
    it 'image,title,description,category,condition,delivery_fee,shipping_location,shipment_date,user_idが存在していれば保存できること' do
      expect(@item).to be_valid
    end
    it 'titleが空では保存できないこと' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it 'descriptionが空では保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'category_idが1では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'condition_idが1では保存できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'delivery_fee_idが1では保存できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it 'shipping_location_idが1では保存できないこと' do
      @item.shipping_location_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping location must be other than 1")
    end
    it 'shipment_date_idが1では保存できないこと' do
      @item.shipment_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment date must be other than 1")
    end
    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid")
    end
    it 'priceが300未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it 'priceが8桁では保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999", "Price is invalid")
    end
    it 'priceが全角では保存できないこと' do
      @item.price = "９９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
