class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  validates :date, presence: true
end
