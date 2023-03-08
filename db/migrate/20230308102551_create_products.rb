class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :volume
      t.integer :volume_type
      t.float :price
      t.string :store_shelf
      t.string :img_url

      t.timestamps
    end
  end
end
