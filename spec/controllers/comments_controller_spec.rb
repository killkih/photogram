# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe "POST #create" do
    let!(:first_post) { create(:post) }

    context 'unauthenticated user' do
      it 'can not add comment' do
        expect do
          post :create, params: { post_id: first_post, body: 'test' }
        end.to_not change(Comment, :count)
      end
    end

    context 'authenticated user' do
      before { login(user) }

      it 'can add comment' do
        expect do
          post :create, params: { post_id: first_post, body: 'test' }, format: :turbo_stream
        end.to change(Comment, :count).by(1)
      end

      it 'can not comments with invalid attributes' do
        expect do
          post :create, params: { post_id: first_post, body: nil },  format: :turbo_stream
        end.to_not change(Comment, :count)
      end
    end
  end

  describe 'DELETE #destroy' do

    context 'authenticated user' do
      before { login(user) }

      let(:post) { create(:post, user: user) }
      let(:other_post) { create(:post, user: other_user) }
      let!(:comment) { create(:comment, post: post, user: user) }
      let!(:other_comment) { create(:comment, post: post, user: other_user) }
      let!(:second_comment) { create(:comment, post: other_post, user: other_user) }

      it 'delete his comment' do
        expect { delete :destroy, params: { id: comment }, format: :turbo_stream  }.to change(Comment, :count).by(-1)
      end

      it 'delete comment under his post' do
        expect { delete :destroy, params: { id: other_comment }, format: :turbo_stream }.to change(Comment, :count).by(-1)
      end

      it 'tries to delete comment under someone else post' do
        expect { delete :destroy, params: { id: second_comment}, format: :turbo_stream  }.to change(Comment, :count).by(0)
      end
    end

    context 'unauthenticated user' do
      let(:post) { create(:post, user: other_user) }
      let!(:comment) { create(:comment, post: post, user: other_user) }

      it 'tries to delete comment' do
        expect { delete :destroy, params: { id: comment} }.to change(Comment, :count).by(0)
      end
    end
  end
end
