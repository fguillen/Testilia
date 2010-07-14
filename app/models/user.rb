class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.login_field = :email
  end
  
  has_many :test_sessions, :dependent => :destroy
end
