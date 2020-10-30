require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'email,password,password_confirmation,nickname,first_name,last_name,kana_first_name,kana_last_nameが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上かつ半角英数字混合であれば登録できる' do
          @user.password = '000AAA'
          @user.password_confirmation = @user.password
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailは@を含まなければ登録できない' do
          @user.email = @user.email.gsub(/@/,'')
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '000AA'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordは数字だけでは登録できない(英数字混合のみ可)' do
          @user.password = '000000'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
        end
        it 'passwordは英字だけでは登録できない(英数字混合のみ可)' do
          @user.password = 'AAAAAA'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
        end
        it 'Last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name Full-width characters')
        end
        it 'kana_first_nameが空では登録できない' do
          @user.kana_first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name can't be blank", 'Kana first name Full-width katakana characters')
        end
        it 'kana_first_nameが平仮名では登録できない' do
          @user.kana_first_name = 'たろう'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
        end
        it 'kana_first_nameが半角カナでは登録できない' do
          @user.kana_first_name = 'ﾀﾛｳ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
        end
        it 'kana_first_nameがアルファベットでは登録できない' do
          @user.kana_first_name = 'taro'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
        end
        it 'kana_first_nameが数字では登録できない' do
          @user.kana_first_name = '666'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
        end
        it 'kana_last_nameが空では登録できない' do
          @user.kana_last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana last name can't be blank", 'Kana last name Full-width katakana characters')
        end
        it 'kana_last_nameが平仮名では登録できない' do
          @user.kana_last_name = 'たろう'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
        end
        it 'kana_last_nameが半角カナでは登録できない' do
          @user.kana_last_name = 'ﾀﾛｳ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
        end
        it 'kana_last_nameがアルファベットでは登録できない' do
          @user.kana_last_name = 'taro'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
        end
        it 'kana_last_nameが数字では登録できない' do
          @user.kana_last_name = '666'
          @user.valid?
          expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
        end
        it 'birthdayが空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
