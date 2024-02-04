# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let!(:first_post) { create(:post) }
  let(:user) { create(:user) }

  describe "POST #create" do

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
end
