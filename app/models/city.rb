class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :country

  has_many :windows, dependent: :destroy

  has_attached_file :image, storage: :s3,  s3_credentials: "#{Rails.root}/config/s3.yml", s3_host_name: "s3-ap-northeast-1.amazonaws.com", styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
