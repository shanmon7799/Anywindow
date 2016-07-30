class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :country

  has_many :windows, dependent: :destroy

  def distance
    if self.name == "大三島"
      1506
    elsif self.name == "新加坡"
      2023
    else
      1314
    end
  end
end
