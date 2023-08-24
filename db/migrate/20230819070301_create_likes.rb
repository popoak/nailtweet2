class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :prototype, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :prototype_id], unique: true
  end
end
