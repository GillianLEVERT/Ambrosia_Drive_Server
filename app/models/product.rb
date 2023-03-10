class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  has_many :carts, through: :cart_items
  has_many :orders, through: :order_items
  belongs_to :store_shelf
  has_one :store, through: :store_shelf

  enum volume_type: { L: 0, ml: 1, kg: 2, g: 3, pièce: 4 }

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :volume, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :volume_type, presence: true, numericality: { only_integer: true, in: 0..4 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :img_url, presence: true
  validates :store_shelf, presence: true
end
