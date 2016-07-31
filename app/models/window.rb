class Window < ApplicationRecord
  validates :name, presence: true

  belongs_to :city

  has_many :images, dependent: :destroy

  has_many :audios, dependent: :destroy

  has_many :videos, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :user_windowships, dependent: :destroy
  has_many :users, through: :user_windowships

  has_attached_file :provider_pic, storage: :s3,  s3_credentials: "#{Rails.root}/config/s3.yml", s3_host_name: "s3-ap-northeast-1.amazonaws.com", styles: { medium: "320x212>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :provider_pic, content_type: /\Aimage\/.*\Z/
end
