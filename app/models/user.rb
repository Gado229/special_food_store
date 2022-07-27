class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  paginates_per 20
end
