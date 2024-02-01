# frozen_string_literal: true

require 'rails_helper'

feature 'User can view the list of posts', "
  In order to rate the post
  As an authenticated user
  I'd like to view a list of posts
" do
  given(:user) { create(:user) }
  given!(:posts) { create_list(:post, 5) }

  background { visit root_path }

  scenario 'Authenticated user views the list of posts' do
    sign_in user

    expect(page).to have_content posts[1].body
  end

  scenario 'Unauthenticated user views the list of posts' do
    expect(page).to have_content posts[1].body
  end
end
