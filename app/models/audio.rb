class Audio < ApplicationRecord

	belongs_to :window

	has_attached_file :audio, storage: :s3,  s3_credentials: "#{Rails.root}/config/s3.yml", s3_host_name: "s3-ap-northeast-1.amazonaws.com"
	validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
end
