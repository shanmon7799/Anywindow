class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_create :generate_authentication_token

  has_many :user_windowships, dependent: :destroy
  has_many :windows, through: :user_windowship

  def is_admin?
    self.role == "Admin"
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      #user.fb_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      #existing_user.fb_raw_data = auth
      existing_user.username = auth.info.name
      existing_user.avatar_file_name = auth.info.image
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    byebug
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.username = auth.info.name
    user.avatar_file_name = auth.info.image
    user.password = Devise.friendly_token[0,20]
    #user.fb_raw_data = auth
    user.save!
    return user
  end

  # Web API generate authentication token
  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
  end

  # Web API user authentication
  def get_fb_data
    j = RestClient.get "https://graph.facebook.com/v2.5/me", :params => { :access_token => self.fb_token, :fields => "id,name,email,picture" }
    JSON.parse(j)
  end

  def self.get_fb_data(access_token)
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token } }

    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end
end
