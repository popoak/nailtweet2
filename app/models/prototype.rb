class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :title, presence: true
  # validates :catch_copy, presence: true
  validates :user, presence: true

  def self.search(search)
    if search.present?
      where('title LIKE ? OR catch_copy LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
