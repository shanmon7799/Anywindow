class UserWindowship < ApplicationRecord

	belongs_to :window
	belongs_to :user
	has_one :user_record
end
