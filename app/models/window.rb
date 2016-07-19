class Window < ApplicationRecord
  validates :name, presence: true

  belongs_to :city

end
