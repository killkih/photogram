# frozen_string_literal: true

require 'rails_helper'

feature 'User can unsubscribe from other user', "
  In order to unfollow to the profile
  As an authenticated user
  I'd like to be able to unsubscribe to user profile
" do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given(:friend) { create(:user) }
  given!(:friendship) { create(:friendship, user: user, friend: friend) }

  context 'Authenticated user' do

    background { sign_in user }

    scenario 'unsubscribe from friend' do
      visit profile_path(friend)

      click_on 'Unsubscribe'

      expect(page).to_not have_button 'Unsubscribe'
      expect(page).to have_content 'You have unsubscribed!'
    end

    scenario 'try to unsubscribe from user' do
      visit profile_path(other_user)

      expect(page).to_not have_button 'Unsubscribe'
      expect(page).to have_button 'Subscribe'
    end

    scenario 'try to unsubscribe from yourself' do
      visit profile_path(user)

      expect(page).to_not have_button 'Unsubscribe'
    end
  end

  context 'Unauthenticated user' do
    scenario 'try to unsubscribe' do
      visit profile_path(user)

      expect(page).to_not have_button 'Unsubscribe'
    end
  end
end
