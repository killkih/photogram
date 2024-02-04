# frozen_string_literal: true

require 'rails_helper'

feature 'User can add comment to the post', "
  In order to give respect to the author
  As an authenticated user
  I'd like to be able to add comments
" do
  given(:user) { create(:user) }
  given!(:first_post) { create(:post, user: user) }

  scenario 'Authenticated user add comment' do
    sign_in user
    visit post_path(first_post)

    fill_in 'Comment', with: 'text text text'
    click_on 'Comment'

    expect(page).to have_content 'text text text'
  end

  scenario 'Unauthenticated user tries to add comment' do
    visit post_path(first_post)
    expect(page).to_not have_button 'Add Comment'
  end
end
