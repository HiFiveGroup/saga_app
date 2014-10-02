class User < ActiveRecord::Base
  has_many :sagas
  has_many :comments
end
