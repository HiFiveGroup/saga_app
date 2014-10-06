class Chapter < ActiveRecord::Base
  belongs_to :saga
  has_many :comments
  has_one :user, through: :sagas
end
