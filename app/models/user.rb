class User < ActiveRecord::Base
  has_many :streetwords
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:twitter]
  validates :email,
            :presence => true, 
            :uniqueness => {:case_sensitive => false, :scope=>:accont_id }, 
            :if => 'provider.blank?'
  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of    :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of    :password, :on=>:create
  validates_confirmation_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid, name: auth.info.nickname, image: auth.info.image, access_token: auth.credentials.token, access_secret: auth.credentials.secret).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.nickname
        user.image = auth.info.image
        user.email = auth.info.email || auth.info.nickname
        # user.access_token = auth.credentials.token
        # user.access_secret = auth.credentials.secret
        user.password = Devise.friendly_token[0,20]
      end
  end

  def email_required?
  	super && provider.blank?
  end

end
