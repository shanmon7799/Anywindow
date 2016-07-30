class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :country

  has_many :windows, dependent: :destroy

  has_attached_file :image, storage: :s3,  s3_credentials: "#{Rails.root}/config/s3.yml", s3_host_name: "s3-ap-northeast-1.amazonaws.com", default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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
