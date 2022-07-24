class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :phone, null:false
  paginates_per 10
end
