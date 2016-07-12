class City < ApplicationRecord

  belongs_to :country

  has_many :windows, dependent: :destroy
end
