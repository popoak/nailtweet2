class User < ApplicationRecord
  has_many :prototypes
  has_many :comments
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :profile, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable   
end
