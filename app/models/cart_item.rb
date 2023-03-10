class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :cart, presence: true
  validates :product, presence: true
end
