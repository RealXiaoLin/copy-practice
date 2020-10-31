class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Password Include both letters and numbers' }
  with_options presence: true do
    validates :birthday
    validates :nickname
    validates :first_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters' }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters' }
    validates :kana_first_name, format: { with: VALID_KANA_NAME_REGEX, message: 'Full-width katakana characters' }
    validates :kana_last_name, format: { with: VALID_KANA_NAME_REGEX, message: 'Full-width katakana characters' }
  end

  has_many :items
end
