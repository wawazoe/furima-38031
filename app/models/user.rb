class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :nickname,   presence: true
  #validates :email,      presence: true, uniqueness: true
  validates :birthday,   presence: true

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' } do
    validates :first_kana
    validates :last_kana
  end
end
