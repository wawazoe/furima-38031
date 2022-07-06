class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
 # has_many :buys    //未実装のため

  validates :nickname,   presence: true
  validates :birthday,   presence: true

  with_options presence: true, format:{with: /\A[a-z0-9\d]{6,99}+\z/i, message: '登録は出来ません'} do
  validates :password
  end


  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' } do
    validates :first_kana
    validates :last_kana
  end
end
