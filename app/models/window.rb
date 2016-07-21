class Window < ApplicationRecord
  validates :name, presence: true

  belongs_to :city

  has_many :images, dependent: :destroy

  has_many :audios, dependent: :destroy

end
