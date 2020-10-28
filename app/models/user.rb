class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    validates :birthday, presence: true

  with_options presence: true do
    validates :nickname, presence: true, format: { with: /\A[a-z A-Z 0-9 ぁ-んァ-ン一-龥]\z/, message: "is invalid. Input full-width characters."}
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\z/, message: "is invalid. Input full-width characters."}
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\z/, message: "is invalid. Input full-width characters."}
    validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]\z/, message: "is invalid. Input full-width characters."}
    validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]\z/, message: "is invalid. Input full-width characters."}
  end
end
