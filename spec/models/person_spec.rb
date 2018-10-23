require 'rails_helper'

RSpec.describe Person, type: :model do
  subject { build(:person) }

  it { should validate_presence_of(:name) }
end
