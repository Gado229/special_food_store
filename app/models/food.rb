class Food < ApplicationRecord
  belongs_to :restaurant

  belongs_to :user

  scope :ordered, -> { order(created_at: :desc) }

  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, :description, null:false, presence: true, length: { minimum: 1 }
  validates :price, null:false
  validates :image, presence: false

  scope :kaminari, -> (kaminari_page){ page(kaminari_page).per(5) }

  paginates_per 10
end
