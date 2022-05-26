class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :price
      t.text :image
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
