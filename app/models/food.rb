class Food < ApplicationRecord
  belongs_to :restaurant

  belongs_to :user

  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  
  validates :name, :description, null:false, presence: true, length: { minimum: 1 }
  validates :price, null:false
  validates :image, presence: true
  validates :phone, null:false
end
