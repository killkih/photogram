# frozen_string_literal: true

require 'rails_helper'

feature 'User can subscribe to other user', "
  In order to follow to the profile
  As an authenticated user
  I'd like to be able to subscribe to user profile
" do

  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given(:friend) { create(:user) }
  given!(:friendship) { create(:friendship, user: user, friend: friend) }

  context 'Authenticated user' do
    background { sign_in user }

    scenario 'subscribe to user' do
      visit profile_path(other_user)

      click_on 'Subscribe'

      expect(page).to_not have_button 'Subscribe'
      expect(page).to have_content 'You have subscribed!'
    end

    scenario 'try to subscribe to friend' do
      visit profile_path(friend)

      expect(page).to_not have_button 'Subscribe'
    end

    scenario 'try to subscribe to yourself' do
      visit profile_path(user)

      expect(page).to_not have_button 'Subscribe'
    end
  end

  context 'Unauthenticated user' do
    scenario 'try to subscribe' do
      visit profile_path(other_user)

      expect(page).to_not have_button 'Subscribe'
    end
  end
end
