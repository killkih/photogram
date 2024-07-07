require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:friend).class_name('User') }

  describe 'validations' do
    subject { create(:friendship) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:friend_id) }
  end
end
