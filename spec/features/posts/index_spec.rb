# frozen_string_literal: true

require 'rails_helper'

feature 'User can view the list of posts', "
  In order to rate the post
  As an authenticated user
  I'd like to view a list of posts
" do
  given!(:posts) { create_list(:post, 5) }

  scenario 'User views the list of posts' do
    visit root_path

    expect(page).to have_content posts[1].body
  end
end
