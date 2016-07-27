class Video < ApplicationRecord

	belongs_to :window

  has_attached_file :video, storage: :s3,  s3_credentials: "#{Rails.root}/config/s3.yml", s3_host_name: "s3-ap-northeast-1.amazonaws.com"
  validates_attachment_content_type :video, :content_type => [ 'video/mov','video/mp4']
end
