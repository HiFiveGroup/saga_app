class Chapter < ActiveRecord::Base
  belongs_to :saga
  has_many :comments
end
