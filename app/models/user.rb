class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :nickname,   presence: true
  validates :birthday,   presence: true

  with_options presence: true, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を登録できません'} do
  validates :password
  end


  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を登録できません'} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'を登録できません'} do
    validates :first_kana
    validates :last_kana
  end
end
