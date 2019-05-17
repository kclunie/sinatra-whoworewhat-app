class User < ActiveRecord::Base
  has_secure_password
  
  has_many :outfit_entries
end
