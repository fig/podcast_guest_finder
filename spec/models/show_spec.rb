require 'rails_helper'

RSpec.describe Show, type: :model do
  subject { build(:show) }

  it { should validate_presence_of(:name) }
end
