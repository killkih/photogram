# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /index' do
    let(:posts) { create_list(:post, 3) }

    before { get :index }

    it 'populates an array of all posts' do
      expect(assigns(:posts)).to match_array(posts)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do
      it 'saves a new post in the database' do
        expect { post :create, params: { post: attributes_for(:post) } }.to change(Post, :count).by(1)
      end

      it 'redirects to index view' do
        post :create, params: { post: attributes_for(:post) }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the post' do
        expect do
          post :create, params: { post: attributes_for(:post, :invalid) }
        end.to_not change(Post, :count)
      end
      it 're-renders new view' do
        post :create, params: { post: attributes_for(:post, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:post) { create(:post) }

    it 'delete the post' do
      expect { delete :destroy, params: { id: post } }.to change(Post, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: post }
      expect(response).to redirect_to root_path
    end
  end
end
