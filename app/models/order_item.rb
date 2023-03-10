class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product, presence: true
  validates :order, presence: true
end
