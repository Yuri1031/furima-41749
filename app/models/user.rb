class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :family_name, presence: true, format: { with: /\A[^a-zA-Z0-9]+\z/ }
  validates :personal_name, presence: true, format: { with: /\A[^a-zA-Z0-9]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/ }
  validates :personal_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/ }
  validates :nickname, presence: true
  validates :birthday, presence: true
end
