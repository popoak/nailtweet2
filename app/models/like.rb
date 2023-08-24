class Like < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  def self.liked_by_user?(user, prototype)
    exists?(user_id: user.id, prototype_id: prototype.id)
  end
end