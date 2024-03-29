# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

require "digest"

class User < ActiveRecord::Base
  has_many :microposts
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessor :password, :password_confirmation

  email_regex = /\A[\w+\-.]*@[a-z\d\-.]*\.[a-z]*\z/i
  validates :name, :presence => true,
            :length => {:maximum=>50}
  validates :email, :presence => true,
            :length => {:maximum => 200},
            :format=>{:with=> email_regex},
            :uniqueness => {:case_sensitive => false}

  validates :password, :presence => true,
            :confirmation => true, :length => {:within => 6..40}

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  before_save :encrypt_password
  private
  def encrypt_password
    self.salt = make_salt unless has_password?(password)
    self.encrypted_password = encrypt(self.password)
  end

  def encrypt(password)
    secure_has("#{salt}--#{password}")
  end

  def make_salt()
    secure_has("#{Time.new.utc}--#{password}")
  end

  def secure_has(string)
    Digest::SHA2.hexdigest(string)
  end

  def name
    "current user"
  end

  def copy_right
    "copy right"
  end

  def version
    "Beta 2"
  end

end
