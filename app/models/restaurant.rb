class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :name, :adress, :phone, null:false, length: { minimum: 1 }
end
