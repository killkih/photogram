# frozen_string_literal: true

require 'rails_helper'

feature 'The user can view the post', "
  In order to get feedback from the community
  As authenticated or unauthenticated user
  I'd like to see the post
" do
  given(:post) { create(:post) }

  scenario 'Authenticated user views the post' do

    visit post_path(post)

    expect(page).to have_content post.body
  end
end
