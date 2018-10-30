require 'rails_helper'

RSpec.describe Episode, type: :model do
  subject { build(:episode) }

  it { should validate_presence_of(:show) }
  it { should validate_presence_of(:name) }
end
