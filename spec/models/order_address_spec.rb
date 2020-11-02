require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe OrderAddress do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品購入' do
      context '商品購入手続きがうまくいくとき' do
        it 'zip_code,region_id,city,building,house_number,phone_number,item_id,user_id,tokenがあれば保存ができること' do
          expect(@order_address).to be_valid
        end
      end
      context '商品購入手続きがうまくいかないとき' do
        it 'zip_codeが空では登録できないこと' do
          @order_address.zip_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid')
        end
        it 'zip_codeが「-」無しでは登録できないこと' do
          @order_address.zip_code = @order_address.zip_code.gsub(/-/, '')
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Zip code is invalid')
        end
        it 'zip_codeは「-]より前が3桁でなければ登録できないこと' do
          @order_address.zip_code = 1111 - 111
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Zip code is invalid')
        end
        it 'zip_codeは「-]より後が4桁でなければ登録できないこと' do
          @order_address.zip_code = 11 - 11_111
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Zip code is invalid')
        end
        it 'region_idが空では登録できないこと' do
          @order_address.region_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Region can't be blank", 'Region is not a number')
        end
        it 'region_idが「1」では登録できないこと' do
          @order_address.region_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Region must be other than 1')
        end
        it 'cityが空では登録できないこと' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank", 'City is invalid')
        end
        it 'cityが数字を含む場合には登録できないこと' do
          @order_address.city = '横浜市1区'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('City is invalid')
        end
        it 'cityが英字を含む場合には登録できないこと' do
          @order_address.city = '横浜市b区'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('City is invalid')
        end
        it 'house_numberが空では登録できないこと' do
          @order_address.house_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空では登録できないこと' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
        end
        it 'phone_numberが12桁以上では登録できないこと' do
          @order_address.phone_number = 111_111_111_111
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが9桁以下では登録できないこと' do
          @order_address.phone_number = 222_222_222
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが「-」を含む場合には登録できないこと' do
          @order_address.phone_number = 222 - 222_222
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end
        it 'user_idが空では登録できないこと' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では登録できないこと' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it 'tokenが空では登録できないこと' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
