# frozen_string_literal: true

require 'rails_helper'

feature "The user can view your profile,
  In order to get feedback from the community
  As authenticated or unauthenticated user
  I'd like to see the post" do

  given(:user) { create(:user, bio: 'bio', first_name: 'first_name', last_name: 'last_name') }

  scenario 'Authenticated user views the post' do
    sign_in user
    visit profile_path(user)

    expect(page).to have_content user.nickname
    expect(page).to have_content user.email
    expect(page).to have_content user.bio
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
  end

  scenario 'Unauthenticated user viesw the post' do
    visit profile_path(user)

    expect(page).to have_content user.nickname
    expect(page).to have_content user.email
    expect(page).to have_content user.bio
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
  end
end
