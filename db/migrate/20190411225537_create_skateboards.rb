class CreateSkateboards < ActiveRecord::Migration[5.2]
  def change
    create_table :skateboards do |t|
      t.integer :user_id
      t.string :brand
      t.integer :length
      t.string :model

      t.timestamps
    end
  end
end
