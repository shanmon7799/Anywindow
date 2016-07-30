class Window < ApplicationRecord
  validates :name, presence: true

  belongs_to :city

  has_many :images, dependent: :destroy

  has_many :audios, dependent: :destroy

  has_many :videos, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :user_windowships, dependent: :destroy
  has_many :users, through: :user_windowships
end
