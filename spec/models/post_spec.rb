# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to (:user) }

  it { should have_many(:comments).dependent(:destroy) }

  it { should validate_presence_of :content }
end
