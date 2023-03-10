class StoreShelf < ApplicationRecord
  belongs_to :store
  has_many :products

  validates :name, presence: true
  validates :store, presence: true
end
