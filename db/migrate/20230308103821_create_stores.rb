class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :img_url
      t.belongs_to :admin, index: true
      t.timestamps
    end
  end
end
