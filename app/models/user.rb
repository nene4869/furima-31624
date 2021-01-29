class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :orders

  with_options presence: true do
    validates :nickname
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'
    
    validates :surname,       format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :family_name,   format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :surname_k,     format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters' }
    validates :family_name_k, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: ' Full-width katakana characters' }
    validates :birth_date
  end
end
