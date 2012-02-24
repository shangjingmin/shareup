class User < ActiveRecord::Base
  #validate rules
  validates_presence_of :email
  validates_uniqueness_of :email
  
  #virtual attribute: password
  attr_accessor :password
  #validates_presence_of :password
  validates_format_of :password, :with=>/^[^\s]{3,}$/, :message=>"password not passed!"
  validates_confirmation_of :password
  #note confirmation only works if it present!
  validates_presence_of :password_confirmation, :if=>:password_changed?

  before_create :encrypt_password
  def encrypt_password
    return unless password.present?
    self.password_salt = SecureRandom.hex(20) 
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(password)
    self.class.encrypt(self.password_salt, password)
  end

  #用SHA1摘要算法加密用户密码，需一个预设的salt值
  def self.encrypt(salt, password)
    Digest::SHA1.hexdigest("--kill--#{salt}--#{password}--bad--")
  end 
end
