# frozen_string_literal: true

require 'rails_helper'

feature 'User can view the list of friends', "
  In order to go to friend page
  As an authenticated user
  I'd like to view a list of friends
" do
  given(:user) { create(:user) }
  given!(:friendships) { create_list(:friendship, 3, user: user) }

  scenario 'Authenticated user views the list of friends' do
    sign_in user
    visit friends_path

    expect(page).to have_link friendships[1].friend.nickname
  end

  scenario 'Unauthenticated user views the list of friends' do
    visit friends_path

    expect(page).to_not have_link friendships[1].friend.nickname
  end
end
