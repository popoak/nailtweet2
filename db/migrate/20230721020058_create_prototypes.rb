class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :title,              null: false
      t.string :catch_copy,         null: false
      t.integer :price,             null: false
      t.references :user,           null: false, foreign_key: true
     

      t.timestamps
    end
  end
end
