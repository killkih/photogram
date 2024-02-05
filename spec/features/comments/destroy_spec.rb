# frozen_string_literal: true

require 'rails_helper'

feature 'Author can destroy his comment', "
  In order to remove an erroneous comment
  As an author
  I'd like to be able to destroy my comment
" do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given(:post) { create(:post, user: user) }
  given(:other_post) { create(:post, user: other_user) }

  context 'Authenticated user' do
    scenario 'Author tries to destroy his comment' do
      create(:comment, post: post, user: user, body: 'comment test')

      sign_in user
      visit post_path(post)

      within '.comments' do
        click_on 'Delete'

        visit post_path(post)

        expect(page).to_not have_content 'comment test'
      end
    end

    scenario 'Author of post tries to destroy someone comment' do
      create(:comment, post: post, user: other_user, body: 'test comment')

      sign_in user
      visit post_path(post)

      within '.comments' do
        click_on 'Delete'

        visit post_path(post)

        expect(page).to_not have_content 'test comment'
      end
    end

    scenario 'Tries to destroy other comment' do
      create(:comment, post: post, user: user)

      sign_in other_user
      visit post_path(other_post)

      expect(page).to_not have_link 'Delete'
    end
  end

  context 'Unauthenticated user' do
    scenario 'Tries to destroy other comment' do
      create(:comment, post: post, user: user)

      visit post_path(other_post)

      expect(page).to_not have_link 'Delete'
    end
  end
end
