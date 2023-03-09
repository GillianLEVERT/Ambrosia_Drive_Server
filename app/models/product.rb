class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  has_many :carts, through: :cart_items
  has_many :orders, through: :order_items
  belongs_to :store_shelf
  has_one :store, through: :store_shelf

  enum volume_type: { L: 0, ml: 1, kg: 2, g: 3, pièce: 4 }
end
