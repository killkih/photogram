# frozen_string_literal: true

require 'rails_helper'

feature 'The user can view the post', "
  In order to get feedback from the community
  As authenticated or unauthenticated user
  I'd like to see the post
" do

  given(:user) { create(:user) }
  given(:post) { create(:post) }

  background { visit post_path(post) }

  scenario 'Authenticated user views the post' do
    sign_in user

    expect(page).to have_content post.body
  end

  scenario 'Unauthenticated user viesw the post' do
    expect(page).to have_content post.body
  end
end
