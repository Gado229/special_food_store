class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :phone, null:false
end
