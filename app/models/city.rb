class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :country

  has_many :windows, dependent: :destroy
end
