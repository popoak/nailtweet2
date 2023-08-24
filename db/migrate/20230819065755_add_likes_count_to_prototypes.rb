class AddLikesCountToPrototypes < ActiveRecord::Migration[6.1]
  def change
    add_column :prototypes, :likes_count, :integer, default: 0
  end
end