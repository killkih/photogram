# frozen_string_literal: true

require 'rails_helper'

feature 'Author can destroy his post', "
  In order not to clutter up the list
  As an author
  I'd like to be able to destroy my post
" do

  given!(:post) { create(:post) }

  scenario 'Author tries to destroy his post' do

    visit post_path(post)
    click_on 'Delete'

    expect(page).to have_content 'Post successfully deleted!'
  end
end
