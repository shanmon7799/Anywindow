class Audio < ApplicationRecord

	belongs_to :window

	has_attached_file :audio
	validates_attachment_presence :audio
	validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']


end
