class Store < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :store_shelves
  has_many :products
end
