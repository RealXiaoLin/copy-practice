class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    validates :birthday, presence: true
    validates :nickname, presence: true

  with_options presence: true do
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"}
    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"}
    validates :kana_first_name,format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :kana_last_name,format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  end
end
