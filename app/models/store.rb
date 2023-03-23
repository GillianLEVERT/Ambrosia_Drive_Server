class Store < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :store_shelves
  has_many :products, through: :store_shelves

  validates :name, presence: true
  validates :img_url, presence: true
  validates :admin_id, presence: true
end
