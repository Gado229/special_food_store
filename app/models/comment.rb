class Comment < ApplicationRecord
  belongs_to :food
  belongs_to :user
  validates :title, presence: false
  validates :content, presence: true, length: { minimum: 1 }
end
