# frozen_string_literal: true

require 'rails_helper'

feature 'User can edit his post', "
  In order to correct mistakes
  As an author of post
  I'd like to be able to edit my post
" do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:post) { create(:post, user: user) }

  scenario 'Unauthenticated user can not edit post' do
    visit post_path(post)

    expect(page).to_not have_link 'Edit'
  end

  describe 'Authenticated user' do
    scenario 'edits his post' do
      sign_in user
      visit post_path(post)

      click_on 'Edit'

      fill_in 'Content', with: 'https://media.npr.org/assets/img/2014/08/07/monkey-selfie_custom-7117031c832fc3607ee5b26b9d5b03d10a1deaca-s1100-c50.jpg'
      fill_in 'Body', with: 'test test test test'
      click_on 'Post'

      expect(page).to have_content 'test test test test'
    end

    scenario 'edits his post with errors' do
      sign_in user
      visit post_path(post)

      click_on 'Edit'

      fill_in 'Content', with: ''
      click_on 'Post'

      expect(page).to have_content "Content can't be blank"
    end

    scenario "tries to edit other user's post" do
      sign_in other_user
      visit post_path(post)

      expect(page).to_not have_link 'Edit'
    end
  end
end
