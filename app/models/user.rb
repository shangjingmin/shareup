#encoding: utf-8
class User < ActiveRecord::Base

  EMAIL_REGEX = /^[-\w\.]{3,}@\w+(\.\w+)+$/i 
  validates_format_of :email, :with=>EMAIL_REGEX, :message=>"格式：#{EMAIL_REGEX}！"
  validates_uniqueness_of :email, :message=>"太受喜爱，已被用！"
  
  attr_accessor :password #virtual attribute: password
  validates_format_of :password, :with=>/^[^\s]{3,}$/, :on=>:create, :message=>"password not passed!"

  before_create :_init
  def _init
    self.nickname = self.email.to_s.sub(/@.*$/, '')
  end

  def self.authenticate(params = {})
    if params.key?(:email) && params.key?(:password)
      user = User.find_by_email(params[:email])
      return if user.nil?
      return user if user.password?(params[:password])
    end
  end

  def password?(password)  
    encrypt(password.to_s.strip) == self.encrypted_password
  end

  before_create :encrypt_password
  def encrypt_password
    self.password_salt = SecureRandom.hex(20) 
    self.encrypted_password = encrypt(self.password) 
  end

  def encrypt(password)
    self.class.encrypt(self.password_salt, password)
  end

  #用SHA1摘要算法加密用户密码，需一个预设的salt值
  def self.encrypt(salt, password)
    Digest::SHA1.hexdigest("--kill--#{salt}--#{password}--bad--")
  end 
end
