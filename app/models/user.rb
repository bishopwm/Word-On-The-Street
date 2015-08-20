class User < ActiveRecord::Base
  has_many :streetwords
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]
  validates :email,
            :presence => true,  
            :if => 'provider.blank?'
  
  validates_format_of    :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of    :password, :on=>:create
  validates_confirmation_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true


  def self.from_omniauth(auth)
  	# email_response = HTTParty.get("https://graph.facebook.com/#{auth.uid}/fields=email")
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.access_token = auth.credentials.token
        user.access_secret = auth.credentials.secret
        user.password = Devise.friendly_token[0,20]
      end
  end

  def email_required?
  	super && provider.blank?
  end

end
