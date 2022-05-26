class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :adress, null: false
      t.string :phone, null: false
      #t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
