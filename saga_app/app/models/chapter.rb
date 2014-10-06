class Chapter < ActiveRecord::Base
  acts_as_taggable
  belongs_to :saga
  has_many :comments
  has_one :user, through: :sagas
end
