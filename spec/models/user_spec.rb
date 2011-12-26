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

require 'spec_helper'

describe User do

  before(:each) do
    @attr = {:name=>"Example User",
             :email=>"user@example.com",
    :password => "foobar",
    :password_confirmation => "foobar"}
  end

  describe "name and email validations" do
    it "should create new instance given valid attribute" do
      User.create!(@attr)
    end

    it "should require a name" do
      no_name_user = User.new(@attr.merge(:name=>""))
      no_name_user.should_not be_valid
    end

    it "should require an email address" do
      no_email_user = User.new(@attr.merge(:email=>""))
      no_email_user.should_not be_valid
    end

    it "should reject name that are too long" do
      long_name = "a" *51
      long_name_user = User.new(@attr.merge(:name=>long_name))
      long_name_user.should_not be_valid
    end

    it "should reject email that are tool long" do
      long_email = "a" * 201
      long_email_user = User.new(@attr.merge(:email=>long_email))
      long_email_user.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w{user@example.com user2@example.com user3@example.com}
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email=>address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email address" do
      addresses = %w{user@example.com, user2@example,com user3@example,com.}
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email=>address))
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject duplication email address" do
      duplication_email_address = @attr[:email]
      User.create!(@attr.merge(:email=>duplication_email_address))
      user_with_duplication_email = User.new(@attr)
      user_with_duplication_email.should_not be_valid
    end

    it "should reject email address identical up to case" do
      duplication_email_address = @attr[:email].upcase
      User.create!(@attr.merge(:email=>duplication_email_address))
      user_with_duplication_email = User.new(@attr)
      user_with_duplication_email.should_not be_valid
    end
  end

  describe "password validations" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should require a password" do
      User.new(@attr.merge(:password=>"", :password_confirmation=>"")).should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation=>"invalid")).should_not be_valid
    end

    it "should reject short passwords" do
      short_password = "a" * 5
      hash = @attr.merge(:password=>short_password, :password_confirmation=>short_password)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long_password = "a" *41
      hash = @attr.merge(:password=>long_password, :password_confirmation=>long_password)
      User.new(hash).should_not be_valid
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end

    describe "has password? method" do
      it "should be true if the password match" do
        @user.has_password?(@attr[:password]).should be_true
      end

      it "should be false if the password don't match'" do
        @user.has_password?("invalid").should be_false
      end
    end
  end

  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should return nil on email/password mismatch" do
      wrong_password_user = User.authenticate(@attr[:email],"wrongpassword")
      wrong_password_user.should be_nil
    end

    it "should return the user on email/password match" do
      matching_user = User.authenticate(@attr[:email], @attr[:password])
      matching_user.should eq(@user)
    end
  end

end
