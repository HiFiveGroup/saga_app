class User < ActiveRecord::Base
  has_secure_password
  has_many :sagas
  has_many :chapters, through: :sagas
  has_many :comments
end
