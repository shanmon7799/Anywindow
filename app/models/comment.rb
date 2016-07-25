class Comment < ApplicationRecord

	belongs_to :window
  belongs_to :user
end
