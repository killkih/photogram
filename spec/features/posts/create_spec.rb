require 'rails_helper'

feature 'User can create post', "
  In order to get respect from a community
  As an authenticated user
  I'd like to be able to create posts
" do
  background { visit new_post_path }

  scenario 'Create a post' do
    fill_in 'Content', with: 'https://images.unsplash.com/photo-1566275529824-cca6d008f3da?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGhvdG98ZW58MHx8MHx8fDA%3D'
    fill_in 'Body', with: 'text text text'
    click_on 'Post'

    expect(page).to have_content 'Post successfully created!'
    expect(page).to have_content 'text text text'
  end

  scenario 'Create a post with errors' do
    click_on 'Post'

    expect(page).to have_content "Content can't be blank"
  end
end

