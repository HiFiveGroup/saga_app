require 'rails_helper'

RSpec.describe Saga, :type => :model do
  it { should belong_to(:user) }
  it { should have_many(:chapters) }
end
