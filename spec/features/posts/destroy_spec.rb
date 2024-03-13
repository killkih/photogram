# frozen_string_literal: true

require 'rails_helper'

feature 'Author can destroy his post', "
  In order not to clutter up the list
  As an author
  I'd like to be able to destroy my post
" do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:post) { create(:post, user: user) }

  scenario 'Author tries to destroy his post' do
    sign_in user

    visit post_path(post)
    click_on 'Delete'

    expect(page).to have_content 'Post successfully deleted!'
  end

  scenario 'Tries to destroy other post' do
    sign_in other_user

    visit post_path(post)

    expect(page).to_not have_link 'Delete'
  end
end
