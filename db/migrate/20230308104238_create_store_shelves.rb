class CreateStoreShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :store_shelves do |t|
      t.string :name
      t.belongs_to :store, index: true
      t.timestamps
    end
  end
end
